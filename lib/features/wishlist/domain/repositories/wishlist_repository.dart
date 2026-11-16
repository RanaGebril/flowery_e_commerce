import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/entities/wishlist_response_entity.dart';

abstract interface class WishlistRepository {
  Future<Result<WishlistResponseEntity>> getWishlist();
  Future<Result<void>> addProductToWishlist(String productId);
}