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
        return _handleStatusCode(exception.response?.statusCode);

      case DioExceptionType.cancel:
        return  UnexpectedFailure();

      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return  UnexpectedFailure();
    }
  }

  static Failure _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 401:
        return  UnauthorizedFailure();

      case 404:
        return NotFoundFailure();

      case 500:
      case 502:
      case 503:
      case 504:
        return  ServerFailure();

      default:
        return  UnexpectedFailure();
    }
  }
}
