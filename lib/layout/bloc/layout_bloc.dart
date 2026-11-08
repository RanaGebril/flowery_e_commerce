import 'package:flowery_e_commerce/layout/bloc/layout_event.dart';
import 'package:flowery_e_commerce/layout/bloc/layout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutBloc extends Bloc<MainLayoutEvent, MainLayoutState> {
  MainLayoutBloc() : super(const MainLayoutState()) {
    on<ChangeTabEvent>((event, emit) {
      emit(
        state.copyWith(
          currentIndex: event.index,
          clearCategory: event.index == 1,
        ),
      );
    });

    on<OpenCategoryEvent>((event, emit) {
      emit(
        state.copyWith(
          currentIndex: 1,
          selectedCategoryId: event.categoryId,
        ),
      );
    });

    on<OpenCategoriesEvent>((event, emit) {
      emit(
        state.copyWith(
          currentIndex: 1,
          clearCategory: true,
        ),
      );
    });
  }
}