abstract class HomeEvent {}

class GetHomeContentEvent extends HomeEvent {}

class LoadMoreCategoriesEvent extends HomeEvent {}

class GetSpecificProductEvent extends HomeEvent {
  final String productId;

  GetSpecificProductEvent({required this.productId});
}