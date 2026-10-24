from django.conf import settings
from django.utils import timezone
from drf_spectacular.utils import extend_schema
from rest_framework import permissions, serializers, status
from rest_framework.exceptions import ValidationError
from rest_framework.response import Response
from rest_framework.views import APIView

from apps.core.permissions import IsFarmAdmin
from apps.farms.models import Farm

from .models import SubscriptionEvent


class CheckoutLinkRequestSerializer(serializers.Serializer):
    tier = serializers.ChoiceField(choices=list(Farm.PlanTier.choices)[1:])  # exclude FREE


class CheckoutLinkView(APIView):
    """Generates a Stripe Checkout URL the admin opens outside the app
    (sales-assisted, web-based checkout -- the model we decided on to
    avoid App Store/Play in-app-purchase fees).
    """

    permission_classes = [permissions.IsAuthenticated, IsFarmAdmin]
    serializer_class = CheckoutLinkRequestSerializer

    def post(self, request):
        if not settings.STRIPE_SECRET_KEY:
            return Response(
                {"detail": "Stripe is not configured on this server yet."},
                status=status.HTTP_503_SERVICE_UNAVAILABLE,
            )

        tier = request.data.get("tier")
        price_id = settings.STRIPE_PRICE_IDS.get(tier)
        if not price_id:
            raise ValidationError({"tier": f"Unknown or unconfigured tier '{tier}'."})

        import stripe

        stripe.api_key = settings.STRIPE_SECRET_KEY
        farm = request.user.farm
        session = stripe.checkout.Session.create(
            mode="subscription",
            line_items=[{"price": price_id, "quantity": 1}],
            success_url=settings.FRONTEND_BILLING_SUCCESS_URL,
            cancel_url=settings.FRONTEND_BILLING_CANCEL_URL,
            client_reference_id=str(farm.id),
            customer=farm.stripe_customer_id or None,
        )
        return Response({"checkout_url": session.url})


class StripeWebhookView(APIView):
    """No auth -- Stripe calls this directly. Trust is established via
    signature verification instead of a JWT.
    """

    permission_classes = [permissions.AllowAny]
    authentication_classes = []

    @extend_schema(exclude=True)  # Stripe calls this, not the mobile app
    def post(self, request):
        import stripe

        if not settings.STRIPE_WEBHOOK_SECRET:
            return Response({"detail": "Webhook secret not configured."}, status=status.HTTP_503_SERVICE_UNAVAILABLE)

        try:
            event = stripe.Webhook.construct_event(
                request.body,
                request.META.get("HTTP_STRIPE_SIGNATURE", ""),
                settings.STRIPE_WEBHOOK_SECRET,
            )
        except (ValueError, stripe.error.SignatureVerificationError):
            return Response({"detail": "Invalid signature."}, status=status.HTTP_400_BAD_REQUEST)

        # Idempotency: Stripe redelivers events, so a repeat must be a no-op.
        if SubscriptionEvent.objects.filter(stripe_event_id=event["id"]).exists():
            return Response({"detail": "Already processed."})

        data_object = event["data"]["object"]
        farm_id = data_object.get("client_reference_id") or (data_object.get("metadata") or {}).get("farm_id")
        farm = Farm.objects.filter(id=farm_id).first() if farm_id else None

        log = SubscriptionEvent.objects.create(
            farm=farm, stripe_event_id=event["id"], event_type=event["type"], payload=event,
        )

        if farm is not None:
            self._apply_event(farm, event["type"], data_object)
            log.processed_at = timezone.now()
            log.save()

        return Response({"detail": "ok"})

    def _apply_event(self, farm, event_type, data_object):
        if event_type == "checkout.session.completed":
            farm.stripe_customer_id = data_object.get("customer") or farm.stripe_customer_id
            farm.stripe_subscription_id = data_object.get("subscription") or farm.stripe_subscription_id
            farm.save()
        elif event_type == "customer.subscription.deleted":
            farm.plan_tier = Farm.PlanTier.FREE
            farm.save()
        elif event_type == "customer.subscription.updated":
            items = (data_object.get("items") or {}).get("data") or []
            price_id = items[0]["price"]["id"] if items else None
            tier = next((t for t, pid in settings.STRIPE_PRICE_IDS.items() if pid and pid == price_id), None)
            if tier:
                farm.plan_tier = tier
                farm.save()
