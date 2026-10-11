import 'package:dio/dio.dart';

import '../error/api_error_handler.dart';
import '../error/failure.dart';
import '../result/result.dart';

class SafeApiCall {
  Future<Result<T>> execute<T>(
      Future<T> Function() apiCall,
      ) async {
    try {
      final data = await apiCall();

      return Success<T>(data);
    } on DioException catch (exception) {
      if (exception.type == DioExceptionType.cancel) {
        rethrow;
      }

      return Error<T>(
        ApiErrorHandler.handle(exception),
      );
    } on FormatException {
      return  Error<T>(
        UnexpectedFailure(),
      );
    } catch (exception) {
      // TODO: Add production logging.
      return  Error<T>(
        UnexpectedFailure(),
      );
    }
  }
}
