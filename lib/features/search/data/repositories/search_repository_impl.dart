import 'package:flowery_e_commerce/core/networking/safe_api_call.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flowery_e_commerce/features/search/data/api/search_api_client.dart';
import 'package:flowery_e_commerce/features/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository{
  final SearchApiClient _searchApiClient;

  SearchRepositoryImpl(this._searchApiClient);

  @override
  Future<Result<List<ProductEntity>>> searchProducts(String keyword) {
    return safeCall(() async{
      var response = await _searchApiClient.searchProducts(keyword);
      return response.products?.map((e) => e.toEntity()).toList() ?? [];
    },);
  }
 }