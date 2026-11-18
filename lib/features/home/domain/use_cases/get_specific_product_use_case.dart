import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flowery_e_commerce/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetSpecificProductUseCase {
  final HomeRepository _homeRepository;

  GetSpecificProductUseCase(this._homeRepository);

  Future<Result<ProductEntity>> call(String productId) {
    return _homeRepository.getSpecificProduct(productId);
  }
}
