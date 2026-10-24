// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_occurrences_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodayOccurrencesController)
final todayOccurrencesControllerProvider =
    TodayOccurrencesControllerProvider._();

final class TodayOccurrencesControllerProvider
    extends
        $AsyncNotifierProvider<
          TodayOccurrencesController,
          List<OccurrenceModel>
        > {
  TodayOccurrencesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayOccurrencesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayOccurrencesControllerHash();

  @$internal
  @override
  TodayOccurrencesController create() => TodayOccurrencesController();
}

String _$todayOccurrencesControllerHash() =>
    r'4348601abd8c62697d9acbd7fa25dae5b8eb897a';

abstract class _$TodayOccurrencesController
    extends $AsyncNotifier<List<OccurrenceModel>> {
  FutureOr<List<OccurrenceModel>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<OccurrenceModel>>, List<OccurrenceModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<OccurrenceModel>>,
                List<OccurrenceModel>
              >,
              AsyncValue<List<OccurrenceModel>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
