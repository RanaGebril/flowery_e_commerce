import 'package:flowery_e_commerce/core/networking/safe_api_call.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/explore/data/api/explore_api_client.dart';
import 'package:flowery_e_commerce/features/explore/domain/entities/categories_page_entity.dart';
import 'package:flowery_e_commerce/features/explore/domain/repositories/explore_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ExploreRepository )
class ExploreRepositoryImpl implements ExploreRepository{
  final ExploreApiClient _exploreApiClient;
  const ExploreRepositoryImpl(this._exploreApiClient);

  @override
  Future<Result<CategoriesPageEntity>> getCategories({int page = 1}) {
   return safeCall(() async {
     final response = await _exploreApiClient.getCategories(page: page);
     return CategoriesPageEntity(
         categories: response.categories.map((c) => c.toEntity()).toList(),
         currentPage: response.metadata?.currentPage ?? page,
         totalPages: response.metadata?.totalPages ?? page,
     );
   });
  }

}