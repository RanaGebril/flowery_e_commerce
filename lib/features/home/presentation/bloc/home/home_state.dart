import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/core/state_status/state_status.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/occasion_entity.dart';

class HomeState extends Equatable {
  final StateStatus<bool> getHomeContentState;

  final List<CategoryEntity> categories;
  final List<ProductEntity> bestSeller;
  final List<OccasionEntity> occasions;


  const HomeState({
    this.getHomeContentState = const StateStatus.initial(),
    this.categories = const [],
    this.bestSeller = const [],
    this.occasions = const [],
  });

  HomeState copyWith({
    StateStatus<bool>? getHomeContentState,
    List<CategoryEntity>? categories,
    List<ProductEntity>? bestSeller,
    List<OccasionEntity>? occasions,

  }) {
    return HomeState(
      getHomeContentState:
      getHomeContentState ?? this.getHomeContentState,
      categories: categories ?? this.categories,
      bestSeller: bestSeller ?? this.bestSeller,
      occasions: occasions ?? this.occasions,
    );
  }

  @override
  List<Object?> get props => [
    getHomeContentState,
    categories,
    bestSeller,
    occasions,
  ];
}