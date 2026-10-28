import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/core/constants/endpoints_constants.dart';
import 'package:flowery_e_commerce/features/explore/data/models/categories_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'explore_api_client.g.dart';

@RestApi()
@injectable
abstract class ExploreApiClient {
  @factoryMethod
  factory ExploreApiClient(Dio dio) = _ExploreApiClient;

@GET(EndpointsConstants.categories)
  Future<CategoriesResponseDto> getCategories({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
  });
}