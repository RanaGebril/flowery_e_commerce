import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/explore/domain/entities/categories_page_entity.dart';
import 'package:flowery_e_commerce/features/explore/domain/repositories/explore_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCategoriesUseCase {
  final ExploreRepository _exploreRepository;

  GetCategoriesUseCase(this._exploreRepository);

  Future<Result<CategoriesPageEntity>> call({int page = 1}) =>
      _exploreRepository.getCategories(page: page);
}
