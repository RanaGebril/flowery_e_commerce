import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/categories/domain/repositories/categories_repository.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  final CategoriesRepository _categoriesRepository;

  GetAllProductsUseCase(this._categoriesRepository);

  Future<Result<List<ProductEntity>>> call() {
    return _categoriesRepository.getAllProducts();
  }
}