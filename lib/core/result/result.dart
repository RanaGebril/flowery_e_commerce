import 'package:flowery_e_commerce/core/error/failure.dart';

sealed class Result<T> {
  const Result();
}

class SuccessResult<T> extends Result<T> {
  final T data;

  const SuccessResult(this.data);
}

class ErrorResult<T> extends Result<T> {
  final Failure failure;

const ErrorResult(this.failure);
}

// طريقة نرجع بيها النجاح أو الفشل بشكل واضح ومنظّم بدل ما كل جزء في التطبيق يتعامل مع Exceptions بطريقته.
// وده دور الـ Result