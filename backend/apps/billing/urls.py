from django.urls import path

from .views import CheckoutLinkView, StripeWebhookView

urlpatterns = [
    path("billing/checkout-link/", CheckoutLinkView.as_view(), name="billing-checkout-link"),
    path("billing/webhook/stripe/", StripeWebhookView.as_view(), name="billing-webhook-stripe"),
]
