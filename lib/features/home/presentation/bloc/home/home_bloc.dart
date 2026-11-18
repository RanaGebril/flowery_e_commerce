import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/Home_content_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/use_cases/get_home_content_use_case.dart';
import 'package:flowery_e_commerce/features/home/domain/use_cases/get_specific_product_use_case.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_event.dart';
import 'package:flowery_e_commerce/features/home/presentation/bloc/home/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeContentUseCase _getHomeContentUseCase;
  final GetSpecificProductUseCase _getSpecificProductUseCase;

  HomeBloc(this._getHomeContentUseCase, this._getSpecificProductUseCase)
    : super(const HomeState()) {
    on<GetHomeContentEvent>(_getHomeContent);
    on<GetSpecificProductEvent>(_getSpecificProduct);
  }

  Future<void> _getHomeContent(
    GetHomeContentEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(getHomeContentState: StateStatus.loading()));

    final result = await _getHomeContentUseCase.call();

    switch (result) {
      case SuccessResult<HomeContentEntity>():
        final home = result.data;

        emit(
          state.copyWith(
            getHomeContentState: StateStatus.success(true),
            categories: home.categories ?? [],
            bestSeller: home.bestSeller ?? [],
            occasions: home.occasions ?? [],
          ),
        );

      case ErrorResult<HomeContentEntity>():
        emit(
          state.copyWith(
            getHomeContentState: StateStatus.failure(result.failure),
          ),
        );
    }
  }

  Future<void> _getSpecificProduct(
    GetSpecificProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(getSpecificProductState: StateStatus.loading()));

    final result = await _getSpecificProductUseCase.call(event.productId);

    switch (result) {
      case SuccessResult<ProductEntity>():
        emit(
          state.copyWith(
            getSpecificProductState: StateStatus.success(result.data),
          ),
        );
      case ErrorResult<ProductEntity>():
        emit(
          state.copyWith(
            getSpecificProductState: StateStatus.failure(result.failure),
          ),
        );
    }
  }
}
