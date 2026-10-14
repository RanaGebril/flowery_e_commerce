import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/core/constants/app_config.dart';
import 'package:injectable/injectable.dart';

import '../networking/dio_factory.dart';

// register dio in injectable -- how it’s registered in DI
@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() => DioFactory.create(baseUrl: AppConfig.baseUrl);
}
