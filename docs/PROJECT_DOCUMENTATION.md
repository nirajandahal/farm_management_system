# Farmloop — Project Documentation

_Status as of 2026-09-09. Written to checkpoint the build before manual product testing begins._

Farmloop is an integrated farm management app covering animals, crops, fish, and fungi
operations. It has a Django REST Framework backend and a Flutter mobile frontend, built
feature-by-feature with each mobile screen verified against a real backend (PostgreSQL)
and, for mobile UI, against a real iOS Simulator.

---

## 1. Tech stack

**Backend:** Django 6.1, Django REST Framework, PostgreSQL, Redis, Celery + Celery Beat,
`djangorestframework-simplejwt` (JWT auth), `drf-spectacular` (OpenAPI schema/Swagger),
Cloudinary (media storage), Stripe (billing).

**Mobile:** Flutter, Riverpod 3.x (`riverpod_generator`, `@riverpod` code-gen), go_router
(`StatefulShellRoute.indexedStack` for the bottom-nav shell), Freezed (immutable models),
Dio (HTTP), hand-written API service classes (not generated from the OpenAPI schema),
`flutter_secure_storage` (token storage).

**Repo layout:**
```
backend/    Django project (config/, apps/)
mobile/     Flutter app (lib/features/<domain>/{data,application,presentation}/)
docs/       This documentation
```
The repo is not currently under git version control.

---

## 2. Backend

### 2.1 Apps and models

| App | Models | Purpose |
|---|---|---|
| `core` | `UUIDModel`, `TimestampedModel`, `ArchivableModel` | Shared abstract base classes. Archive-not-delete pattern via `ArchivableModel`. |
| `accounts` | `User` | Custom user model (UUID PK), role + farm membership, social auth fields. |
| `farms` | `Farm`, `Zone` | A farm and its physical zones (coop, plot, storage, ...). |
| `inventory` | `LivingInventoryItem`, `AnimalDetail`, `CropDetail`, `FishDetail`, `FungiDetail`, `HealthLogEntry`, `ProductionLogEntry`, `BreedingLogEntry` | The "living inventory": one base item row + a domain-specific detail row, plus append-only log tables. |
| `supplies` | `Supply`, `SupplyConsumptionGroup`, `ConsumptionLogEntry`, `SupplyForecast` | Stock tracking, linkage from a supply to the inventory items that consume it, consumption history, and computed depletion forecasts. |
| `schedules` | `Schedule`, `Occurrence` | Recurring task rule (`Schedule`) vs. individual task instance (`Occurrence`). `Occurrence` denormalizes `title` and `urgency` from its parent `Schedule` for offline-friendly rendering. |
| `audit` | `AuditLogEntry` | Immutable audit trail entry: actor, action, category, target, description. |
| `notifications` | `DeviceToken`, `Notification` | Push token registration and in-app notifications. |
| `billing` | `SubscriptionEvent` | Stripe subscription lifecycle events. |

Key enums:
- `User.Role`: `ADMIN`, `FARMHAND`
- `Farm.PlanTier`: `FREE`, `TIER_1`, `TIER_2`, `TIER_3`
- `LivingInventoryItem.DomainType`: `ANIMAL`, `CROP`, `FISH`, `FUNGI`
- `Schedule.Urgency` / `Occurrence.Urgency`: `URGENT`, `ROUTINE`
- `Occurrence` status includes `OVERDUE`
- `AuditLogEntry.Category`: `HEALTH`, `SUPPLY`, `SCHEDULE`, `TEAM`, `MANAGEMENT`, ...

### 2.2 API surface (`/api/v1/`)

| Endpoint | Notes |
|---|---|
| `POST auth/social/google/`, `POST auth/social/apple/` | Social login; invite-then-claim account matching. |
| `POST auth/dev-login/` | **DEBUG-only.** Mints a token pair for an existing user by email, no real OAuth needed. |
| `POST auth/token/refresh/` | JWT refresh. |
| `GET/PATCH me/` | Current user profile. |
| `GET farm/`, `GET farm/modules/` | Farm detail and enabled modules (animals/plants/fish/fungi). |
| `/zones/` (ViewSet) | Farm zones CRUD. |
| `GET team/`, `POST team/invite/`, `PATCH/DELETE team/<user_id>/` | Team management. `PATCH` changes role; `DELETE` detaches the user from the farm (`farm=None`, `role=None`) rather than deleting the account. Admin-only. |
| `/inventory/` (ViewSet), plus `inventory/<id>/health-log/`, `.../production-log/`, `.../breeding-log/` | Living inventory CRUD and per-item logs. |
| `/supplies/` (ViewSet) | Supply CRUD, stock, consumption. |
| `/schedules/`, `/occurrences/` (ViewSets) | Recurring rules and individual task instances (the Triage feed). |
| `GET audit/` | Audit trail, farm-scoped. |
| `POST notifications/register-device/`, `GET notifications/`, `POST notifications/<id>/read/` | Push tokens and in-app notifications. |
| `GET billing/checkout-link/`, `POST billing/webhook/stripe/` | Stripe checkout + webhook. |
| `GET /api/schema/`, `GET /api/docs/` | OpenAPI schema and Swagger UI. |

### 2.3 Permissions

Defined in `apps/core/permissions.py`:
- `IsFarmMember` — any authenticated user with a farm.
- `IsFarmAdmin` — role must be `ADMIN`. Gates team management, audit, analytics, schedule/rule editing.
- `require_plan_tier(*tiers)` — factory gating a view to specific subscription tiers, independent of role.

### 2.4 Background jobs (Celery Beat)

| Task | Schedule | Purpose |
|---|---|---|
| `apps.schedules.tasks.generate_upcoming_occurrences` | Daily, 01:00 UTC | Generates `Occurrence` rows from active `Schedule` rules, `horizon_days=21`. Idempotent (skips dates that already have an occurrence) — daily execution self-heals a missed run. |
| `apps.supplies.tasks.recompute_supply_forecasts` | Daily, 02:00 UTC | Recomputes `SupplyForecast` depletion estimates from consumption history. |

### 2.5 Management commands

- `manage.py seed_demo` — seeds a realistic demo farm (idempotent, safe to re-run). Creates:
  - **Owner (Admin):** `owner@farmloop.demo` / Jane Farmer
  - **Farmhand:** `sam@farmloop.demo` / Sam Rivers
  - Farm "Green Valley Farm" (Tier 1), 3 zones, 2 animal inventory items + 1 crop, 2 supplies,
    3 recurring schedules with generated occurrences (one pre-completed each), and 2 audit
    log entries.
- `manage.py demo_token [email]` — prints a fresh JWT access token for a user (for Swagger's
  Authorize button). Omit the email to print tokens for both demo users.

---

## 3. Mobile app

### 3.1 Navigation

`go_router` with a `StatefulShellRoute.indexedStack` bottom-nav shell
(`lib/core/router/app_shell.dart`, `lib/core/router/app_router.dart`):

| Tab | Route | Screen |
|---|---|---|
| Triage | `/` | `HomeScreen` — the day's due/overdue occurrences, swipe-to-complete. |
| Inventory | `/inventory`, `/inventory/:id` | `LivingInventoryScreen`, `InventoryDetailScreen` — tabbed by Animals/Plants/Fish/Fungi. |
| Supplies | `/supplies`, `/supplies/:id` | `SuppliesScreen`, `SupplyDetailScreen`. |
| Team | `/team` (Admin only) | `TeamAuditScreen` — Members + Activity tabs. |

The Team tab is hidden from the nav bar for Farmhands (`app_shell.dart`) **and** the
router itself redirects away from `/team` for a non-admin who deep-links there directly
— defense in depth matching the backend's `IsFarmAdmin` gate.

Login (`/login`) has two Dev Login buttons (DEBUG builds only) that call the backend's
`dev-login` endpoint directly, bypassing real Google/Apple OAuth:
- **Dev Login — Owner (Admin)** → `owner@farmloop.demo`
- **Dev Login — Sam (Farmhand)** → `sam@farmloop.demo`

### 3.2 Features implemented

| Feature | State |
|---|---|
| Auth (login, dev-login, token storage/refresh) | Built, verified |
| Triage / Home (occurrence feed, swipe-to-complete) | Built, verified. Confirmed the linked-supply auto-deduction pipeline fires on completion (e.g. 20.00kg → 15.00kg). |
| Living Inventory (list, detail, tabs by domain) | Built, verified |
| Supplies (list, detail, stock) | Built, verified |
| Team (list, invite, promote/demote, remove) | Built. Promote/demote/remove verified end-to-end against the backend. Invite dialog not yet verified via automation — see §5. |
| Audit trail (Activity tab, category chips, actor-name lookup) | Built, verified |
| `farm/` and `notifications/` feature folders | Scaffolded only (empty `data`/`application`/`presentation`) — **no UI built yet.** |

### 3.3 State management notes

- Riverpod 3.x: `AsyncValue.valueOrNull` does not exist in this version — use `.value`
  directly (it's nullable). This has tripped up implementation more than once; watch for it.
- **Controllers read only via `.notifier` (never `.watch`'d)** have nothing keeping them
  alive under default `autoDispose` behavior and can be disposed mid-async-operation,
  silently dropping a subsequent `ref.invalidate()` call. Every action-only controller in
  this codebase (e.g. `TeamActionsController`, `SupplyActionsController`) is annotated
  `@Riverpod(keepAlive: true)` for this reason — keep doing this for new action controllers.

### 3.4 Dev workflow

- **Web preview:** `flutter run -d web-server` hangs in this sandbox (missing Dart Debug
  Chrome Extension). Working pattern, wired into `.claude/launch.json` as `flutter-web`:
  `flutter build web --debug -o build/web` then serve `build/web` with
  `python3 -m http.server 5050`.
- **iOS Simulator:** `flutter build ios --debug --simulator`, then install/launch on a
  booted simulator. Coordinates for tap automation are in **device points**, not
  screenshot pixels (iPhone 17 Pro: 402×874pt; observed screenshot-px→pt scale ≈2.3). There
  is real latency between a tap and the UI update becoming visible in a screenshot —
  screenshots alone are not reliable proof an action registered; verify mutating actions
  against the backend directly.

---

## 4. Running it locally

### 4.1 Backend

```bash
cd backend
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env   # fill in DATABASE_URL at minimum; Cloudinary/Stripe/OAuth keys optional for local dev
python manage.py migrate
python manage.py seed_demo
python manage.py runserver 0.0.0.0:8000
```
Requires PostgreSQL and Redis running locally (`DATABASE_URL`, `CELERY_BROKER_URL` in `.env`).
For background jobs: `celery -A config worker -l info` and `celery -A config beat -l info`.

### 4.2 Mobile — web preview

```bash
cd mobile
flutter build web --debug -o build/web
cd build/web && python3 -m http.server 5050
```

### 4.3 Mobile — iOS Simulator

```bash
cd mobile
flutter build ios --debug --simulator
```
Then install the built `.app` onto a booted simulator.

### 4.4 Demo accounts

| Role | Email | Notes |
|---|---|---|
| Admin (owner) | `owner@farmloop.demo` | Jane Farmer. Sees Team tab. |
| Farmhand | `sam@farmloop.demo` | Sam Rivers. No Team tab. |

Log in via the **Dev Login** buttons on the login screen (DEBUG builds only) — no real
Google/Apple credentials needed.

---

## 5. Known issues / open items

- **Invite dialog (Team screen) not verified via simulator automation.** The FAB tap
  didn't register across 7 calibrated attempts (`tap`, `touch_path`, varying coordinates),
  while every other tap on the same screen worked with the same calibration approach. Code
  review shows a standard `showDialog`, consistent with other dialogs in the app — this
  looks like an automation-tool limitation, not an app bug, matching an earlier confirmed
  case with the Triage swipe gesture. **Needs manual verification.**
- `farm/` and `notifications/` mobile features are scaffolded (empty folders) but have no
  screens yet.
- No automated integration/E2E test suite beyond `flutter analyze` / `flutter test` (unit
  level) and manual backend-query verification during simulator testing.
- Project is not under git version control yet.

---

## 6. Manual testing checklist

See the companion testing checklist (interactive version published separately) for a
walkthrough covering Auth, Triage, Inventory, Supplies, Team, and Audit. At minimum, before
resuming feature work, manually verify:

- [ ] Invite a farmhand from the Team screen and confirm the new user appears (backend: role should default to `FARMHAND`, `farm` set).
- [ ] Full sign-in flow with both demo accounts, confirming Team tab visibility differs by role.
- [ ] Triage swipe-to-complete on a real device/simulator, by hand.
- [ ] General navigation flow across all four tabs, including inventory/supply detail drill-down and back navigation.
