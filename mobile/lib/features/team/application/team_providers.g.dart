// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(teamList)
final teamListProvider = TeamListProvider._();

final class TeamListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserModel>>,
          List<UserModel>,
          FutureOr<List<UserModel>>
        >
    with $FutureModifier<List<UserModel>>, $FutureProvider<List<UserModel>> {
  TeamListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'teamListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$teamListHash();

  @$internal
  @override
  $FutureProviderElement<List<UserModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserModel>> create(Ref ref) {
    return teamList(ref);
  }
}

String _$teamListHash() => r'36168078ca7e4cff95965b723ec4eb02f925dba0';

/// keepAlive: true -- read via `.notifier` (a one-time read, not a watch),
/// so without this it could be disposed mid-mutation and silently drop the
/// invalidate() calls that refresh the UI afterward. See the identical
/// issue (and full explanation) fixed in SupplyActionsController.

@ProviderFor(TeamActionsController)
final teamActionsControllerProvider = TeamActionsControllerProvider._();

/// keepAlive: true -- read via `.notifier` (a one-time read, not a watch),
/// so without this it could be disposed mid-mutation and silently drop the
/// invalidate() calls that refresh the UI afterward. See the identical
/// issue (and full explanation) fixed in SupplyActionsController.
final class TeamActionsControllerProvider
    extends $NotifierProvider<TeamActionsController, void> {
  /// keepAlive: true -- read via `.notifier` (a one-time read, not a watch),
  /// so without this it could be disposed mid-mutation and silently drop the
  /// invalidate() calls that refresh the UI afterward. See the identical
  /// issue (and full explanation) fixed in SupplyActionsController.
  TeamActionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'teamActionsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$teamActionsControllerHash();

  @$internal
  @override
  TeamActionsController create() => TeamActionsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$teamActionsControllerHash() =>
    r'00f2be4bbee9c50bd59bb13f698a3f58c8d3bfea';

/// keepAlive: true -- read via `.notifier` (a one-time read, not a watch),
/// so without this it could be disposed mid-mutation and silently drop the
/// invalidate() calls that refresh the UI afterward. See the identical
/// issue (and full explanation) fixed in SupplyActionsController.

abstract class _$TeamActionsController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
