import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:flowery_e_commerce/features/categories/domain/repositories/categories_repository.dart';

@injectable
class GetSortedProductsUseCase {
  final CategoriesRepository _categoriesRepository;

  GetSortedProductsUseCase(this._categoriesRepository);

  Future<Result<List<ProductEntity>>> call(String sortOptions) {
    return _categoriesRepository.getSortedProducts(sortOptions);
  }
}
