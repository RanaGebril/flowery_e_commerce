import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/core/constants/endpoints_constants.dart';
import 'package:flowery_e_commerce/features/wishlist/data/models/add_to_wishlist_response_dto.dart';
import 'package:flowery_e_commerce/features/wishlist/data/models/wishlist_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'wishlist_api_client.g.dart';

@RestApi()
@injectable
abstract class WishlistApiClient {
  @factoryMethod
  factory WishlistApiClient(Dio dio) = _WishlistApiClient;

  @POST(EndpointsConstants.wishlist)
  Future<AddToWishlistResponseDto> addProductToWishlist(
    @Body() Map<String, dynamic> body,
  );

  @GET(EndpointsConstants.wishlist)
  Future<WishListResponseDto> getWishlist();

  @DELETE(EndpointsConstants.wishlistItem)
  Future<AddToWishlistResponseDto> removeFromWishlist(
      @Path('id') String id
      );

}
