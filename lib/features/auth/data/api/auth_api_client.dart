import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/core/constants/endpoints_constants.dart';
import 'package:flowery_e_commerce/features/auth/data/models/request/login_request_dto.dart';
import 'package:flowery_e_commerce/features/auth/data/models/response/login_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi()
@injectable
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(EndpointsConstants.login)
  Future<LoginResponseDto> login(
      @Body() LoginRequestDto body
      );
}