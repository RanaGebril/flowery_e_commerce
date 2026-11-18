import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromWishlistUseCase {
  final WishlistRepository _wishlistRepository;

  RemoveFromWishlistUseCase(this._wishlistRepository);

  Future<Result<void>> call(String productId) {
    return _wishlistRepository.removeFromWishlist(productId);
  }
}
