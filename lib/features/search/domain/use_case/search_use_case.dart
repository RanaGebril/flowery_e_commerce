import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:flowery_e_commerce/features/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchUseCase {
  final SearchRepository _searchRepository;

  SearchUseCase(this._searchRepository);

  Future<Result<List<ProductEntity>>> call(String keyword) {
    return _searchRepository.searchProducts(keyword);
  }
}
