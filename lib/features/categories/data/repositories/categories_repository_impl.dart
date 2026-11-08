import 'package:flowery_e_commerce/core/networking/safe_api_call.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/categories/data/api/categories_api_client.dart';
import 'package:flowery_e_commerce/features/categories/domain/repositories/categories_repository.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesApiClient _categoriesApiClient;

  CategoriesRepositoryImpl(this._categoriesApiClient);

  @override
  Future<Result<List<ProductEntity>>> getAllProducts() async {
    return safeCall(() async {
      var response = await _categoriesApiClient.getAllProducts();
      return response.products?.map((e) => e.toEntity()).toList() ?? [];
    });
  }

  @override
  Future<Result<List<CategoryEntity>>> getAllCategories() {
    return safeCall(() async {
      var response = await _categoriesApiClient.getAllCategories();
      return response.categories?.map((e) => e.toEntity()).toList() ?? [];
    });
  }
}
