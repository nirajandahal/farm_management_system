import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/occurrence_api_service.dart';
import '../data/occurrence_model.dart';

part 'today_occurrences_controller.g.dart';

const _undoWindow = Duration(seconds: 4);

@riverpod
class TodayOccurrencesController extends _$TodayOccurrencesController {
  final Map<String, Timer> _pendingTimers = {};
  final Map<String, OccurrenceModel> _pendingOriginal = {};

  @override
  Future<List<OccurrenceModel>> build() async {
    ref.onDispose(() {
      for (final timer in _pendingTimers.values) {
        timer.cancel();
      }
    });
    return ref.read(occurrenceApiServiceProvider).fetchByDate(_todayIso());
  }

  static String _todayIso() {
    final now = DateTime.now();
    return '${now.year.toString().padLeft(4, '0')}-'
        '${now.month.toString().padLeft(2, '0')}-'
        '${now.day.toString().padLeft(2, '0')}';
  }

  /// Optimistically updates the item's status in place (it stays in the
  /// list -- and counted in "today's progress" -- it just stops rendering
  /// as a swipeable card) and defers the real API call for [_undoWindow],
  /// giving the UI a genuine "Undo" that cancels the call entirely rather
  /// than a fake one that can't actually reverse anything.
  void completeWithUndo(String id, {String? actualQuantity}) {
    _stageStatusChange(id, OccurrenceStatus.completed);
    _pendingTimers[id] = Timer(_undoWindow, () => _finalize(
          id,
          () => ref.read(occurrenceApiServiceProvider).complete(id, actualQuantity: actualQuantity),
        ));
  }

  void skipWithUndo(String id, {String reason = ''}) {
    _stageStatusChange(id, OccurrenceStatus.skipped);
    _pendingTimers[id] = Timer(_undoWindow, () => _finalize(
          id,
          () => ref.read(occurrenceApiServiceProvider).skip(id, reason: reason),
        ));
  }

  void undo(String id) {
    _pendingTimers.remove(id)?.cancel();
    final original = _pendingOriginal.remove(id);
    final current = state.value;
    if (original == null || current == null) return;
    state = AsyncData([
      for (final o in current) if (o.id == id) original else o,
    ]);
  }

  Future<void> refresh() async {
    for (final timer in _pendingTimers.values) {
      timer.cancel();
    }
    _pendingTimers.clear();
    _pendingOriginal.clear();
    ref.invalidateSelf();
    await future;
  }

  void _stageStatusChange(String id, OccurrenceStatus newStatus) {
    final current = state.value;
    if (current == null) return;
    final index = current.indexWhere((o) => o.id == id);
    if (index == -1) return;
    _pendingOriginal[id] = current[index];
    state = AsyncData([
      for (final o in current) if (o.id == id) o.copyWith(status: newStatus) else o,
    ]);
  }

  Future<void> _finalize(String id, Future<void> Function() apiCall) async {
    _pendingTimers.remove(id);
    final original = _pendingOriginal.remove(id);
    try {
      await apiCall();
    } catch (_) {
      // The API call failed -- revert rather than silently leaving the UI
      // showing a completion that never actually happened server-side.
      if (original == null) return;
      final current = state.value;
      if (current == null) return;
      state = AsyncData([
        for (final o in current) if (o.id == id) original else o,
      ]);
    }
  }
}
