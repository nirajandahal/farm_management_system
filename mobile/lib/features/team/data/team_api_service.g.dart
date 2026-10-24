// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(teamApiService)
final teamApiServiceProvider = TeamApiServiceProvider._();

final class TeamApiServiceProvider
    extends $FunctionalProvider<TeamApiService, TeamApiService, TeamApiService>
    with $Provider<TeamApiService> {
  TeamApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'teamApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$teamApiServiceHash();

  @$internal
  @override
  $ProviderElement<TeamApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TeamApiService create(Ref ref) {
    return teamApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TeamApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TeamApiService>(value),
    );
  }
}

String _$teamApiServiceHash() => r'3d5995a53ae01d6c8ef67c69951ad4d8b7d32336';
