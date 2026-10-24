from django.core.management.base import BaseCommand, CommandError
from rest_framework_simplejwt.tokens import RefreshToken

from apps.accounts.models import User


class Command(BaseCommand):
    help = "Prints a fresh JWT access token for a user, for pasting into Swagger's Authorize button."

    def add_arguments(self, parser):
        parser.add_argument("email", nargs="?", default=None, help="User email. Omit to print tokens for both demo users.")

    def handle(self, *args, **options):
        emails = [options["email"]] if options["email"] else ["owner@farmloop.demo", "sam@farmloop.demo"]
        for email in emails:
            try:
                user = User.objects.get(email=email)
            except User.DoesNotExist:
                raise CommandError(f"No user with email {email}")
            token = RefreshToken.for_user(user)
            self.stdout.write(f"--- {email} ({user.role}) ---")
            self.stdout.write(str(token.access_token))
            self.stdout.write("")
