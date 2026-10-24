// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(auditLog)
final auditLogProvider = AuditLogProvider._();

final class AuditLogProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AuditLogModel>>,
          List<AuditLogModel>,
          FutureOr<List<AuditLogModel>>
        >
    with
        $FutureModifier<List<AuditLogModel>>,
        $FutureProvider<List<AuditLogModel>> {
  AuditLogProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'auditLogProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$auditLogHash();

  @$internal
  @override
  $FutureProviderElement<List<AuditLogModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AuditLogModel>> create(Ref ref) {
    return auditLog(ref);
  }
}

String _$auditLogHash() => r'807dde77cfed6d1b62f611ee03fda405bdb046ee';
