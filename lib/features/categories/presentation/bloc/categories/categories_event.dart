part of 'categories_bloc.dart';

sealed class CategoriesEvent {}

class GetAllProductsEvent extends CategoriesEvent {}

class GetAllCategoriesEvent extends CategoriesEvent {}

class SortProductsEvent extends CategoriesEvent {
  final String sort;

  SortProductsEvent(this.sort);
}

class SelectSortOptionEvent extends CategoriesEvent {
  final int selectedSortIndex;

  SelectSortOptionEvent(this.selectedSortIndex);
}
