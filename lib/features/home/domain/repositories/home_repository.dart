import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/Home_content_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';

abstract interface class HomeRepository {
  Future<Result<HomeContentEntity>> getHomeContent();
  Future<Result<ProductEntity>> getSpecificProduct(String productId);
}