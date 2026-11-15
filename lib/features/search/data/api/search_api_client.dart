import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/core/constants/endpoints_constants.dart';
import 'package:flowery_e_commerce/features/home/data/models/home_content_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api_client.g.dart';

@RestApi()
@injectable
abstract class SearchApiClient {
  @factoryMethod
  factory SearchApiClient(Dio dio) = _SearchApiClient;

  @GET(EndpointsConstants.products)
  Future<HomeContentResponseDto> searchProducts(
      @Query('search') String keyword
      );
}