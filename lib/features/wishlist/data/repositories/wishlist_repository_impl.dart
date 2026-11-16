import 'package:flowery_e_commerce/core/networking/safe_api_call.dart';
import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/wishlist/data/api/wishlist_api_client.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/entities/wishlist_response_entity.dart';
import 'package:flowery_e_commerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistApiClient _wishlistApiClient;

  WishlistRepositoryImpl(this._wishlistApiClient);

  @override
  Future<Result<void>> addProductToWishlist(String productId) {
    return safeCall(() async {
      await _wishlistApiClient.addProductToWishlist({'productId': productId});
    });
  }

  @override
  Future<Result<WishlistResponseEntity>> getWishlist() {
    return safeCall(() async {
      var response = await _wishlistApiClient.getWishlist();
      return response.toEntity();
    });
  }
}
