// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(inventoryByDomain)
final inventoryByDomainProvider = InventoryByDomainFamily._();

final class InventoryByDomainProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LivingInventoryItemModel>>,
          List<LivingInventoryItemModel>,
          FutureOr<List<LivingInventoryItemModel>>
        >
    with
        $FutureModifier<List<LivingInventoryItemModel>>,
        $FutureProvider<List<LivingInventoryItemModel>> {
  InventoryByDomainProvider._({
    required InventoryByDomainFamily super.from,
    required DomainType super.argument,
  }) : super(
         retry: null,
         name: r'inventoryByDomainProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inventoryByDomainHash();

  @override
  String toString() {
    return r'inventoryByDomainProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<LivingInventoryItemModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LivingInventoryItemModel>> create(Ref ref) {
    final argument = this.argument as DomainType;
    return inventoryByDomain(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InventoryByDomainProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inventoryByDomainHash() => r'e3f86df03f7069aab946b345b937bb08bcdea2e8';

final class InventoryByDomainFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<LivingInventoryItemModel>>,
          DomainType
        > {
  InventoryByDomainFamily._()
    : super(
        retry: null,
        name: r'inventoryByDomainProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InventoryByDomainProvider call(DomainType domainType) =>
      InventoryByDomainProvider._(argument: domainType, from: this);

  @override
  String toString() => r'inventoryByDomainProvider';
}

@ProviderFor(inventoryDetail)
final inventoryDetailProvider = InventoryDetailFamily._();

final class InventoryDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<LivingInventoryItemModel>,
          LivingInventoryItemModel,
          FutureOr<LivingInventoryItemModel>
        >
    with
        $FutureModifier<LivingInventoryItemModel>,
        $FutureProvider<LivingInventoryItemModel> {
  InventoryDetailProvider._({
    required InventoryDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'inventoryDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$inventoryDetailHash();

  @override
  String toString() {
    return r'inventoryDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LivingInventoryItemModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LivingInventoryItemModel> create(Ref ref) {
    final argument = this.argument as String;
    return inventoryDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InventoryDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$inventoryDetailHash() => r'0711ed5e30105559bda0b5b9b2f93c7cec49ca43';

final class InventoryDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LivingInventoryItemModel>, String> {
  InventoryDetailFamily._()
    : super(
        retry: null,
        name: r'inventoryDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InventoryDetailProvider call(String id) =>
      InventoryDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'inventoryDetailProvider';
}

@ProviderFor(healthLogs)
final healthLogsProvider = HealthLogsFamily._();

final class HealthLogsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<HealthLogEntryModel>>,
          List<HealthLogEntryModel>,
          FutureOr<List<HealthLogEntryModel>>
        >
    with
        $FutureModifier<List<HealthLogEntryModel>>,
        $FutureProvider<List<HealthLogEntryModel>> {
  HealthLogsProvider._({
    required HealthLogsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'healthLogsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$healthLogsHash();

  @override
  String toString() {
    return r'healthLogsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<HealthLogEntryModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<HealthLogEntryModel>> create(Ref ref) {
    final argument = this.argument as String;
    return healthLogs(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is HealthLogsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$healthLogsHash() => r'9761ca8932227e0d82c6331e193206e8c820f1c4';

final class HealthLogsFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<HealthLogEntryModel>>, String> {
  HealthLogsFamily._()
    : super(
        retry: null,
        name: r'healthLogsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HealthLogsProvider call(String itemId) =>
      HealthLogsProvider._(argument: itemId, from: this);

  @override
  String toString() => r'healthLogsProvider';
}

@ProviderFor(productionLogs)
final productionLogsProvider = ProductionLogsFamily._();

final class ProductionLogsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProductionLogEntryModel>>,
          List<ProductionLogEntryModel>,
          FutureOr<List<ProductionLogEntryModel>>
        >
    with
        $FutureModifier<List<ProductionLogEntryModel>>,
        $FutureProvider<List<ProductionLogEntryModel>> {
  ProductionLogsProvider._({
    required ProductionLogsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productionLogsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productionLogsHash();

  @override
  String toString() {
    return r'productionLogsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ProductionLogEntryModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ProductionLogEntryModel>> create(Ref ref) {
    final argument = this.argument as String;
    return productionLogs(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductionLogsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productionLogsHash() => r'003d4e03aac8b22215c6be17f5c5f79b5dea7a7a';

final class ProductionLogsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<ProductionLogEntryModel>>,
          String
        > {
  ProductionLogsFamily._()
    : super(
        retry: null,
        name: r'productionLogsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductionLogsProvider call(String itemId) =>
      ProductionLogsProvider._(argument: itemId, from: this);

  @override
  String toString() => r'productionLogsProvider';
}

@ProviderFor(breedingLogs)
final breedingLogsProvider = BreedingLogsFamily._();

final class BreedingLogsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BreedingLogEntryModel>>,
          List<BreedingLogEntryModel>,
          FutureOr<List<BreedingLogEntryModel>>
        >
    with
        $FutureModifier<List<BreedingLogEntryModel>>,
        $FutureProvider<List<BreedingLogEntryModel>> {
  BreedingLogsProvider._({
    required BreedingLogsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'breedingLogsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$breedingLogsHash();

  @override
  String toString() {
    return r'breedingLogsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<BreedingLogEntryModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BreedingLogEntryModel>> create(Ref ref) {
    final argument = this.argument as String;
    return breedingLogs(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BreedingLogsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$breedingLogsHash() => r'7a201f736073b013b648bc124ff3e896ad764beb';

final class BreedingLogsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<BreedingLogEntryModel>>,
          String
        > {
  BreedingLogsFamily._()
    : super(
        retry: null,
        name: r'breedingLogsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BreedingLogsProvider call(String itemId) =>
      BreedingLogsProvider._(argument: itemId, from: this);

  @override
  String toString() => r'breedingLogsProvider';
}
