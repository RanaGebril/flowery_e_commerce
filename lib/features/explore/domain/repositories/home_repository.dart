import 'package:flowery_e_commerce/core/result/result.dart';
import 'package:flowery_e_commerce/features/explore/domain/entities/Home_content_entity.dart';

abstract interface class HomeRepository {
  Future<Result<HomeContentEntity>> getHomeContent();

}