import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';

abstract interface class CategoriesRepository {
  Future<Result<List<ProductEntity>>>  getAllProducts();
  Future<Result<List<CategoryEntity>>>  getAllCategories();
  Future<Result<List<ProductEntity>>>  getSortedProducts(String sortOption);

}