import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/data/user_model.dart';
import '../data/team_api_service.dart';

part 'team_providers.g.dart';

@riverpod
Future<List<UserModel>> teamList(Ref ref) {
  return ref.watch(teamApiServiceProvider).fetchTeam();
}

/// keepAlive: true -- read via `.notifier` (a one-time read, not a watch),
/// so without this it could be disposed mid-mutation and silently drop the
/// invalidate() calls that refresh the UI afterward. See the identical
/// issue (and full explanation) fixed in SupplyActionsController.
@Riverpod(keepAlive: true)
class TeamActionsController extends _$TeamActionsController {
  @override
  void build() {}

  Future<void> invite(String email) async {
    await ref.read(teamApiServiceProvider).invite(email);
    ref.invalidate(teamListProvider);
  }

  Future<void> changeRole(String userId, String role) async {
    await ref.read(teamApiServiceProvider).changeRole(userId, role);
    ref.invalidate(teamListProvider);
  }

  Future<void> remove(String userId) async {
    await ref.read(teamApiServiceProvider).remove(userId);
    ref.invalidate(teamListProvider);
  }
}
