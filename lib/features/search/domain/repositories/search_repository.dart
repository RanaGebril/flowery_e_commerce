import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';

abstract interface class SearchRepository {
  Future<Result<List<ProductEntity>>> searchProducts(String keyword);
}