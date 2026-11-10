import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/categories/domain/use_cases/get_all_products_use_case.dart';
import 'package:flowery_e_commerce/features/categories/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flowery_e_commerce/features/categories/domain/use_cases/sort_products_use_case.dart';
import 'package:flowery_e_commerce/features/categories/presentation/bloc/categories/categories_state.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'categories_event.dart';

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetSortedProductsUseCase _getSortedProductsUseCase;

  CategoriesBloc(
    this._getAllProductsUseCase,
    this._getAllCategoriesUseCase,
    this._getSortedProductsUseCase,
  ) : super(const CategoriesState()) {
    on<GetAllProductsEvent>(_getAllProducts);
    on<GetAllCategoriesEvent>(_getAllCategories);
    on<SortProductsEvent>(_sortProducts);
    on<SelectSortOptionEvent>(_selectSortOption);
  }

  Future<void> _getAllProducts(
    GetAllProductsEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(getAllProductsState: const StateStatus.loading()));

    final result = await _getAllProductsUseCase.call();

    switch (result) {
      case SuccessResult<List<ProductEntity>>():
        emit(
          state.copyWith(getAllProductsState: StateStatus.success(result.data)),
        );

      case ErrorResult<List<ProductEntity>>():
        emit(
          state.copyWith(
            getAllProductsState: StateStatus.failure(result.failure),
          ),
        );
    }
  }

  Future<void> _getAllCategories(
    GetAllCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(getAllCategoriesState: const StateStatus.loading()));

    final result = await _getAllCategoriesUseCase.call();

    switch (result) {
      case SuccessResult<List<CategoryEntity>>():
        emit(
          state.copyWith(
            getAllCategoriesState: StateStatus.success(result.data),
          ),
        );

      case ErrorResult<List<CategoryEntity>>():
        emit(
          state.copyWith(
            getAllCategoriesState: StateStatus.failure(result.failure),
          ),
        );
    }
  }

  void _selectSortOption(
    SelectSortOptionEvent event,
    Emitter<CategoriesState> emit,
  ) {
    emit(state.copyWith(selectedSortIndex: event.selectedSortIndex));
  }

  Future<void> _sortProducts(
    SortProductsEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(sortProductsState: const StateStatus.loading()));

    final result = await _getSortedProductsUseCase.call(event.sort);

    switch (result) {
      case SuccessResult<List<ProductEntity>>():
        emit(
          state.copyWith(getAllProductsState: StateStatus.success(result.data)),
        );

      case ErrorResult<List<ProductEntity>>():
        emit(
          state.copyWith(
            sortProductsState: StateStatus.failure(result.failure),
          ),
        );
    }
  }
}
