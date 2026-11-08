import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/categories/domain/use_cases/get_all_products_use_case.dart';
import 'package:flowery_e_commerce/features/categories/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;

  CategoriesBloc(
      this._getAllProductsUseCase,
      this._getAllCategoriesUseCase,
      ) : super(const CategoriesState()) {
    on<GetAllProductsEvent>(_getAllProducts);
    on<GetAllCategoriesEvent>(_getAllCategories);
  }

  Future<void> _getAllProducts(
      GetAllProductsEvent event,
      Emitter<CategoriesState> emit,
      ) async {
    emit(state.copyWith(
      getAllProductsState: const StateStatus.loading(),
    ));

    final result = await _getAllProductsUseCase.call();

    switch (result) {
      case SuccessResult<List<ProductEntity>>():
        emit(state.copyWith(
          getAllProductsState: StateStatus.success(result.data),
        ));

      case ErrorResult<List<ProductEntity>>():
        emit(state.copyWith(
          getAllProductsState: StateStatus.failure(result.failure),
        ));
    }
  }

  Future<void> _getAllCategories(
      GetAllCategoriesEvent event,
      Emitter<CategoriesState> emit,
      ) async {
    emit(state.copyWith(
      getAllCategoriesState: const StateStatus.loading(),
    ));

    final result = await _getAllCategoriesUseCase.call();

    switch (result) {
      case SuccessResult<List<CategoryEntity>>():
        emit(state.copyWith(
          getAllCategoriesState: StateStatus.success(result.data),
        ));

      case ErrorResult<List<CategoryEntity>>():
        emit(state.copyWith(
          getAllCategoriesState: StateStatus.failure(result.failure),
        ));
    }
  }
}