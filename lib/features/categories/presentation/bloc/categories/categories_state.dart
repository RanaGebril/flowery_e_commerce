part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final StateStatus<List<ProductEntity>> getAllProductsState;
  final StateStatus<List<CategoryEntity>> getAllCategoriesState;

  const CategoriesState({
    this.getAllProductsState = const StateStatus.initial(),
    this.getAllCategoriesState = const StateStatus.initial(),
  });

  CategoriesState copyWith({
    StateStatus<List<ProductEntity>>? getAllProductsState,
    StateStatus<List<CategoryEntity>>? getAllCategoriesState,
  }) {
    return CategoriesState(
      getAllProductsState: getAllProductsState ?? this.getAllProductsState,
      getAllCategoriesState:
          getAllCategoriesState ?? this.getAllCategoriesState,
    );
  }

  @override
  List<Object?> get props => [getAllProductsState, getAllCategoriesState];
}
