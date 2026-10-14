// convert dio errors to failure types that we defined

import 'package:dio/dio.dart';

import 'failure.dart';

class ApiErrorHandler {
  static Failure handle(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return  TimeoutFailure();

      case DioExceptionType.connectionError:
        return  NetworkFailure();

      case DioExceptionType.badResponse:
        return _handleResponse(exception.response);

      case DioExceptionType.cancel:
        return  UnexpectedFailure();

      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return  UnexpectedFailure();
    }
  }

  static Failure _handleResponse(Response? res) {
    final code = res?.statusCode;
    final msg = _extractMessage(res?.data);
    if (code == 401 && msg == null) return UnauthorizedFailure();
    if (code != null && code >= 500) return ServerFailure(serverMessage: msg);
    if (code == 404) return NotFoundFailure();
    return ServerFailure(serverMessage: msg); // 400, 401, 409, 422...
  }

  static String? _extractMessage(dynamic data) =>
      data is Map ? (data['message'] ?? data['error'])?.toString() : null;
}
