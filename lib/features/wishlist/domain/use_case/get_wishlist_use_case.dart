import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/entities/wishlist_response_entity.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  GetWishlistUseCase(this._wishlistRepository);

  Future<Result<WishlistResponseEntity>> call() {
    return _wishlistRepository.getWishlist();
  }
}
