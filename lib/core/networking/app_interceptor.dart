import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/core/storage/session_storage.dart';

class AppInterceptor extends Interceptor {
  final SessionStorage _sessionStorage;

  AppInterceptor(this._sessionStorage);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    try {

      final token = await _sessionStorage.getToken();

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      handler.next(options);
    } catch (error) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: error,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }
}