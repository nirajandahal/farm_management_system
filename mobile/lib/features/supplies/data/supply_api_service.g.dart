// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supplyApiService)
final supplyApiServiceProvider = SupplyApiServiceProvider._();

final class SupplyApiServiceProvider
    extends
        $FunctionalProvider<
          SupplyApiService,
          SupplyApiService,
          SupplyApiService
        >
    with $Provider<SupplyApiService> {
  SupplyApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supplyApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supplyApiServiceHash();

  @$internal
  @override
  $ProviderElement<SupplyApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SupplyApiService create(Ref ref) {
    return supplyApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupplyApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupplyApiService>(value),
    );
  }
}

String _$supplyApiServiceHash() => r'1486ce8eb441e0da9eba3fedf1991c90a29d8563';
