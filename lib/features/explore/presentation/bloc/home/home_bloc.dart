import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/explore/domain/entities/Home_content_entity.dart';
import 'package:flowery_e_commerce/features/explore/domain/use_cases/get_home_content_use_case.dart';
import 'package:flowery_e_commerce/features/explore/presentation/bloc/home/home_event.dart';
import 'package:flowery_e_commerce/features/explore/presentation/bloc/home/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeContentUseCase _getHomeContentUseCase;

  HomeBloc(this._getHomeContentUseCase) : super(const HomeState()) {
    on<GetHomeContentEvent>(_getHomeContent);
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
}
