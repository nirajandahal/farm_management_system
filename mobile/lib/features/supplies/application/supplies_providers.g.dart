// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplies_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(suppliesList)
final suppliesListProvider = SuppliesListProvider._();

final class SuppliesListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SupplyModel>>,
          List<SupplyModel>,
          FutureOr<List<SupplyModel>>
        >
    with
        $FutureModifier<List<SupplyModel>>,
        $FutureProvider<List<SupplyModel>> {
  SuppliesListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'suppliesListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$suppliesListHash();

  @$internal
  @override
  $FutureProviderElement<List<SupplyModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SupplyModel>> create(Ref ref) {
    return suppliesList(ref);
  }
}

String _$suppliesListHash() => r'cf88fbfea5eb0dde968b3a98d0c030d4decc6e79';

@ProviderFor(supplyDetail)
final supplyDetailProvider = SupplyDetailFamily._();

final class SupplyDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<SupplyModel>,
          SupplyModel,
          FutureOr<SupplyModel>
        >
    with $FutureModifier<SupplyModel>, $FutureProvider<SupplyModel> {
  SupplyDetailProvider._({
    required SupplyDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'supplyDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplyDetailHash();

  @override
  String toString() {
    return r'supplyDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SupplyModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SupplyModel> create(Ref ref) {
    final argument = this.argument as String;
    return supplyDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SupplyDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplyDetailHash() => r'54d7cea95c6ea23437b55aec19010226ebac7c90';

final class SupplyDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SupplyModel>, String> {
  SupplyDetailFamily._()
    : super(
        retry: null,
        name: r'supplyDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplyDetailProvider call(String id) =>
      SupplyDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'supplyDetailProvider';
}

@ProviderFor(supplyForecast)
final supplyForecastProvider = SupplyForecastFamily._();

final class SupplyForecastProvider
    extends
        $FunctionalProvider<
          AsyncValue<ForecastResult>,
          ForecastResult,
          FutureOr<ForecastResult>
        >
    with $FutureModifier<ForecastResult>, $FutureProvider<ForecastResult> {
  SupplyForecastProvider._({
    required SupplyForecastFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'supplyForecastProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplyForecastHash();

  @override
  String toString() {
    return r'supplyForecastProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ForecastResult> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ForecastResult> create(Ref ref) {
    final argument = this.argument as String;
    return supplyForecast(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SupplyForecastProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplyForecastHash() => r'b7e1a7656b16b58d8c227bff78608dc0c82d425d';

final class SupplyForecastFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ForecastResult>, String> {
  SupplyForecastFamily._()
    : super(
        retry: null,
        name: r'supplyForecastProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplyForecastProvider call(String id) =>
      SupplyForecastProvider._(argument: id, from: this);

  @override
  String toString() => r'supplyForecastProvider';
}

@ProviderFor(supplyConsumptionHistory)
final supplyConsumptionHistoryProvider = SupplyConsumptionHistoryFamily._();

final class SupplyConsumptionHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ConsumptionLogModel>>,
          List<ConsumptionLogModel>,
          FutureOr<List<ConsumptionLogModel>>
        >
    with
        $FutureModifier<List<ConsumptionLogModel>>,
        $FutureProvider<List<ConsumptionLogModel>> {
  SupplyConsumptionHistoryProvider._({
    required SupplyConsumptionHistoryFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'supplyConsumptionHistoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$supplyConsumptionHistoryHash();

  @override
  String toString() {
    return r'supplyConsumptionHistoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ConsumptionLogModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ConsumptionLogModel>> create(Ref ref) {
    final argument = this.argument as String;
    return supplyConsumptionHistory(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SupplyConsumptionHistoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$supplyConsumptionHistoryHash() =>
    r'6afbfcd2d2c88e013c6c654eb616e088b53c7cbc';

final class SupplyConsumptionHistoryFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<ConsumptionLogModel>>, String> {
  SupplyConsumptionHistoryFamily._()
    : super(
        retry: null,
        name: r'supplyConsumptionHistoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SupplyConsumptionHistoryProvider call(String id) =>
      SupplyConsumptionHistoryProvider._(argument: id, from: this);

  @override
  String toString() => r'supplyConsumptionHistoryProvider';
}

/// keepAlive: true -- this is read via `.notifier` (a one-time read, not a
/// watch), so with the default autoDispose behavior nothing keeps it alive
/// and it can be disposed while restock()/correctStock() are still
/// in-flight, silently dropping the invalidate() calls that are supposed
/// to refresh the UI after the mutation completes.

@ProviderFor(SupplyActionsController)
final supplyActionsControllerProvider = SupplyActionsControllerProvider._();

/// keepAlive: true -- this is read via `.notifier` (a one-time read, not a
/// watch), so with the default autoDispose behavior nothing keeps it alive
/// and it can be disposed while restock()/correctStock() are still
/// in-flight, silently dropping the invalidate() calls that are supposed
/// to refresh the UI after the mutation completes.
final class SupplyActionsControllerProvider
    extends $NotifierProvider<SupplyActionsController, void> {
  /// keepAlive: true -- this is read via `.notifier` (a one-time read, not a
  /// watch), so with the default autoDispose behavior nothing keeps it alive
  /// and it can be disposed while restock()/correctStock() are still
  /// in-flight, silently dropping the invalidate() calls that are supposed
  /// to refresh the UI after the mutation completes.
  SupplyActionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supplyActionsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supplyActionsControllerHash();

  @$internal
  @override
  SupplyActionsController create() => SupplyActionsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$supplyActionsControllerHash() =>
    r'111c35bf8398386df8a17b6dd65078a78d9d252e';

/// keepAlive: true -- this is read via `.notifier` (a one-time read, not a
/// watch), so with the default autoDispose behavior nothing keeps it alive
/// and it can be disposed while restock()/correctStock() are still
/// in-flight, silently dropping the invalidate() calls that are supposed
/// to refresh the UI after the mutation completes.

abstract class _$SupplyActionsController extends $Notifier<void> {
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
