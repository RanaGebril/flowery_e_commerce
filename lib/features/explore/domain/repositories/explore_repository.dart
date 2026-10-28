import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/explore/domain/entities/categories_page_entity.dart';

abstract interface class ExploreRepository {
  Future<Result<CategoriesPageEntity>> getCategories({int page = 1});
}