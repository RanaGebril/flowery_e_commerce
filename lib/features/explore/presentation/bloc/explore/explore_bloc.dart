import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/explore/domain/entities/categories_page_entity.dart';
import 'package:flowery_e_commerce/features/explore/domain/use_cases/get_categories_use_case.dart';
import 'package:flowery_e_commerce/features/explore/presentation/bloc/explore/explore_event.dart';
import 'package:flowery_e_commerce/features/explore/presentation/bloc/explore/explore_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  ExploreBloc(this._getCategoriesUseCase) : super(const ExploreState()) {
    on<GetCategoriesEvent>(_explore);
    on<LoadMoreCategoriesEvent>(_loadMore);
  }

  Future<void> _explore(
    GetCategoriesEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(getCategoriesState: StateStatus.loading()));
    final result = await _getCategoriesUseCase.call(page: 1);

    switch (result) {
      case SuccessResult<CategoriesPageEntity>():
        final page = result.data;
        emit(
          state.copyWith(
            getCategoriesState: StateStatus.success(page.categories),
            categories: page.categories,
            currentPage: page.currentPage,
            hasReachedMax: page.hasReachedMax,
          ),
        );
      case ErrorResult<CategoriesPageEntity>():
        emit(
          state.copyWith(
            getCategoriesState: StateStatus.failure(result.failure),
          ),
        );
    }
  }

  Future<void> _loadMore(
    LoadMoreCategoriesEvent event,
    Emitter<ExploreState> emit,
  ) async {
    if (state.hasReachedMax || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));
    final result = await _getCategoriesUseCase.call(
      page: state.currentPage + 1,
    );

    switch (result) {
      case SuccessResult<CategoriesPageEntity>():
        final page = result.data;
        emit(
          state.copyWith(
            categories: [...state.categories, ...page.categories],
            currentPage: page.currentPage,
            hasReachedMax: page.hasReachedMax,
            isLoadingMore: false,
          ),
        );
      case ErrorResult<CategoriesPageEntity>():
        emit(
          state.copyWith(isLoadingMore: false),
        );
    }
  }
}
