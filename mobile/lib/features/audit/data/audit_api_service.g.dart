// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(auditApiService)
final auditApiServiceProvider = AuditApiServiceProvider._();

final class AuditApiServiceProvider
    extends
        $FunctionalProvider<AuditApiService, AuditApiService, AuditApiService>
    with $Provider<AuditApiService> {
  AuditApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'auditApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$auditApiServiceHash();

  @$internal
  @override
  $ProviderElement<AuditApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuditApiService create(Ref ref) {
    return auditApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuditApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuditApiService>(value),
    );
  }
}

String _$auditApiServiceHash() => r'b95d275dd7428a8d1a855c782703b380974b8b99';
