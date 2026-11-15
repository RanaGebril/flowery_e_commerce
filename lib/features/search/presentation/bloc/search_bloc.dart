import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/core/utils/debounce_restartable_transformer.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flowery_e_commerce/features/search/domain/use_case/search_use_case.dart';
import 'package:flowery_e_commerce/features/search/presentation/bloc/search_event.dart';
import 'package:flowery_e_commerce/features/search/presentation/bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase _searchUseCase;
  SearchBloc(this._searchUseCase) : super(SearchState()) {
    on<SearchProductsEvent>(
      _searchProducts,
      transformer: debounceRestartable(const Duration(milliseconds: 400)),
    );
    on<ClearSearchEvent>(_clearSearch);
  }

  Future<void> _searchProducts(
    SearchProductsEvent event,
    Emitter<SearchState> emit,
  ) async {
    final keyword = event.keyword.trim();

    // Update keyword first
    emit(state.copyWith(keyword: keyword));

    // Clear search results if keyword is empty
    // if (keyword.isEmpty) {
      emit(
        state.copyWith(
          searchStatus: const StateStatus.initial(),
        ),
      );
    //   return;
    // }

    emit(
      state.copyWith(
        searchStatus: StateStatus.loading(),
      ),
    );
    final result = await _searchUseCase.call(event.keyword);

    switch (result) {
      case SuccessResult<List<ProductEntity>>():
        if (event.keyword.trim().isEmpty) return;
        emit(state.copyWith(searchStatus: StateStatus.success(result.data)));
      case ErrorResult<List<ProductEntity>>():
        emit(state.copyWith(searchStatus: StateStatus.failure(result.failure)));
    }
  }

  void _clearSearch(ClearSearchEvent event, Emitter<SearchState> emit) async {
    emit(
      state.copyWith(
        keyword: '',
        searchStatus: const StateStatus.initial(),
      ),
    );
  }
}
