import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';

class CategoriesState extends Equatable {
  final StateStatus<List<ProductEntity>> getAllProductsState;
  final StateStatus<List<CategoryEntity>> getAllCategoriesState;
  final StateStatus<List<ProductEntity>> sortProductsState;
  final int? selectedSortIndex;

  const CategoriesState({
    this.getAllProductsState = const StateStatus.initial(),
    this.getAllCategoriesState = const StateStatus.initial(),
    this.sortProductsState = const StateStatus.initial(),
    this.selectedSortIndex ,
  });

  CategoriesState copyWith({
    StateStatus<List<ProductEntity>>? getAllProductsState,
    StateStatus<List<CategoryEntity>>? getAllCategoriesState,
    StateStatus<List<ProductEntity>>? sortProductsState,
    int? selectedSortIndex,
  }) {
    return CategoriesState(
      getAllProductsState: getAllProductsState ?? this.getAllProductsState,
      getAllCategoriesState:
          getAllCategoriesState ?? this.getAllCategoriesState,
      sortProductsState: sortProductsState ?? this.sortProductsState,
      selectedSortIndex: selectedSortIndex ?? this.selectedSortIndex,
    );
  }

  @override
  List<Object?> get props => [
    getAllProductsState,
    getAllCategoriesState,
    sortProductsState,
    selectedSortIndex,
  ];
}
