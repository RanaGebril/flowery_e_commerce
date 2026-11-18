import 'package:flowery_e_commerce/core/networking/safe_api_call.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/home/data/api/home_api_client.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/Home_content_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeApiClient _homeApiClient;
  const HomeRepositoryImpl(this._homeApiClient);

  @override
  Future<Result<HomeContentEntity>> getHomeContent() {
    return safeCall(() async {
      final response = await _homeApiClient.getHomeContent();

      return response.toEntity();
    });
  }

  @override
  Future<Result<ProductEntity>> getSpecificProduct(String productId) {
    return  safeCall(() async {
      final response = await _homeApiClient.getSpecificProduct(productId);
      return response.product!.toEntity();
    });
  }
}
