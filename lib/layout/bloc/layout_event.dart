abstract class MainLayoutEvent {}

class ChangeTabEvent extends MainLayoutEvent {
  final int index;

  ChangeTabEvent(this.index);
}

class OpenCategoryEvent extends MainLayoutEvent {
  final String categoryId;

  OpenCategoryEvent(this.categoryId);
}

class OpenCategoriesEvent extends MainLayoutEvent {}