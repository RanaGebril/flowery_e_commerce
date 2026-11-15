abstract class SearchEvent {}

class SearchProductsEvent extends SearchEvent {
   String keyword;

  SearchProductsEvent({required this.keyword});
}

class ClearSearchEvent extends SearchEvent {
  ClearSearchEvent();
}
