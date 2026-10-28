import 'package:equatable/equatable.dart';
import 'category_entity.dart';

class CategoriesPageEntity extends Equatable {
  final List<CategoryEntity> categories;
  final int currentPage;
  final int totalPages;

  const CategoriesPageEntity({
    required this.categories,
    required this.currentPage,
    required this.totalPages,
  });

  bool get hasReachedMax => currentPage >= totalPages;

  @override
  List<Object?> get props => [categories, currentPage, totalPages];
}