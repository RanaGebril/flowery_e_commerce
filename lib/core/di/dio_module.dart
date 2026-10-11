import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../networking/dio_factory.dart';

// register dio in injectable -- how it’s registered in DI
@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() => DioFactory.create();
}
