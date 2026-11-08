import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/categories/domain/repositories/categories_repository.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  final CategoriesRepository _categoriesRepository;

  GetAllCategoriesUseCase(this._categoriesRepository);

  Future<Result<List<CategoryEntity>>> call() {
    return _categoriesRepository.getAllCategories();
  }
}