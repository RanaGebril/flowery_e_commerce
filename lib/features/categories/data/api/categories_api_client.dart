import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/core/constants/endpoints_constants.dart';
import 'package:flowery_e_commerce/features/categories/data/models/all_categories_response_dto.dart';
import 'package:flowery_e_commerce/features/categories/data/models/all_products_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'categories_api_client.g.dart';

@RestApi()
@injectable
abstract class CategoriesApiClient {
  @factoryMethod
  factory CategoriesApiClient(Dio dio) = _CategoriesApiClient;

@GET(EndpointsConstants.products)
  Future<AllProductsResponseDto> getAllProducts();

  @GET(EndpointsConstants.categories)
  Future<AllCategoriesResponseDto> getAllCategories();

}