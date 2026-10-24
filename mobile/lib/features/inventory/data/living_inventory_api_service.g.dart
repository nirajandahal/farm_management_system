// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'living_inventory_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(livingInventoryApiService)
final livingInventoryApiServiceProvider = LivingInventoryApiServiceProvider._();

final class LivingInventoryApiServiceProvider
    extends
        $FunctionalProvider<
          LivingInventoryApiService,
          LivingInventoryApiService,
          LivingInventoryApiService
        >
    with $Provider<LivingInventoryApiService> {
  LivingInventoryApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'livingInventoryApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$livingInventoryApiServiceHash();

  @$internal
  @override
  $ProviderElement<LivingInventoryApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LivingInventoryApiService create(Ref ref) {
    return livingInventoryApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LivingInventoryApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LivingInventoryApiService>(value),
    );
  }
}

String _$livingInventoryApiServiceHash() =>
    r'74b33309ecfa17e07093afa03560f41913e5cfb0';
