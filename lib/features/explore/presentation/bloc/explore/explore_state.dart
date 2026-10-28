import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/explore/domain/entities/category_entity.dart';

class ExploreState extends Equatable {
  final StateStatus<List<CategoryEntity>> getCategoriesState;
  final List<CategoryEntity> categories;
  final int currentPage;
  final bool hasReachedMax;
  final bool isLoadingMore;

  const ExploreState({
    this.getCategoriesState = const StateStatus.initial(),
    this.categories = const [],
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
  });

  ExploreState copyWith({
    StateStatus<List<CategoryEntity>>? getCategoriesState,
    List<CategoryEntity>? categories,
    int? currentPage,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return ExploreState(
      getCategoriesState: getCategoriesState ?? this.getCategoriesState,
      categories: categories ?? this.categories,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props =>
      [getCategoriesState, categories, currentPage, hasReachedMax, isLoadingMore];
}
