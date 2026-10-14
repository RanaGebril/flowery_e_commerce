import 'package:dio/dio.dart';

import '../error/api_error_handler.dart';
import '../error/failure.dart';
import '../result/result.dart';

  Future<Result<T>> safeCall<T>(
      Future<T> Function() apiCall,
      ) async {
    try {
      final data = await apiCall();

      return SuccessResult<T>(data);
    } on DioException catch (exception) {
      if (exception.type == DioExceptionType.cancel) {
        rethrow;
      }

      return ErrorResult<T>(
        ApiErrorHandler.handle(exception),
      );
    } on FormatException {
      return  ErrorResult<T>(
        UnexpectedFailure(),
      );
    } catch (exception) {
      // TODO: Add production logging.
      return  ErrorResult<T>(
        UnexpectedFailure(),
      );
    }
  }

