import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/core/constants/endpoints_constants.dart';
import 'package:flowery_e_commerce/features/explore/data/models/home_content_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_client.g.dart';

@RestApi()
@injectable
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(EndpointsConstants.home)
  Future<HomeContentResponseDto> getHomeContent();
}