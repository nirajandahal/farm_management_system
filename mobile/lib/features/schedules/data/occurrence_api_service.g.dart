// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occurrence_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(occurrenceApiService)
final occurrenceApiServiceProvider = OccurrenceApiServiceProvider._();

final class OccurrenceApiServiceProvider
    extends
        $FunctionalProvider<
          OccurrenceApiService,
          OccurrenceApiService,
          OccurrenceApiService
        >
    with $Provider<OccurrenceApiService> {
  OccurrenceApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'occurrenceApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$occurrenceApiServiceHash();

  @$internal
  @override
  $ProviderElement<OccurrenceApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OccurrenceApiService create(Ref ref) {
    return occurrenceApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OccurrenceApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OccurrenceApiService>(value),
    );
  }
}

String _$occurrenceApiServiceHash() =>
    r'ecd68ca1d5b7ecb2b04c6e0c47a541add54dc30c';
