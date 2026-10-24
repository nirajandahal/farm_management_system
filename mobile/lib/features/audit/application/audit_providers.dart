import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/audit_api_service.dart';
import '../data/audit_log_model.dart';

part 'audit_providers.g.dart';

@riverpod
Future<List<AuditLogModel>> auditLog(Ref ref) {
  return ref.watch(auditApiServiceProvider).fetchLog();
}
