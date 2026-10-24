"""Social-provider token verification.

Both functions take the ID token the mobile app got from the native
Google/Apple sign-in SDK and return the verified identity. Errors from the
underlying libraries (bad signature, expired, wrong audience) propagate as
exceptions -- the view is responsible for turning those into a 401.
"""

from django.conf import settings


def verify_google_token(token: str) -> dict:
    from google.auth.transport import requests as google_requests
    from google.oauth2 import id_token as google_id_token

    idinfo = google_id_token.verify_oauth2_token(
        token, google_requests.Request(), audience=settings.GOOGLE_CLIENT_ID or None
    )
    return {
        "uid": idinfo["sub"],
        "email": idinfo["email"],
        "full_name": idinfo.get("name", ""),
        "photo_url": idinfo.get("picture", ""),
    }


def verify_apple_token(token: str) -> dict:
    import jwt
    from jwt import PyJWKClient

    jwk_client = PyJWKClient("https://appleid.apple.com/auth/keys")
    signing_key = jwk_client.get_signing_key_from_jwt(token)
    payload = jwt.decode(
        token,
        signing_key.key,
        algorithms=["RS256"],
        audience=settings.APPLE_CLIENT_ID or None,
        issuer="https://appleid.apple.com",
        options={"verify_aud": bool(settings.APPLE_CLIENT_ID)},
    )
    return {
        "uid": payload["sub"],
        "email": payload.get("email", ""),
        "full_name": "",
        "photo_url": "",
    }
