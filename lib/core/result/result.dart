import 'package:flowery_e_commerce/core/error/failure.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

class Error<T> extends Result<T> {
  final Failure failure;

const Error(this.failure);
}

// طريقة نرجع بيها النجاح أو الفشل بشكل واضح ومنظّم بدل ما كل جزء في التطبيق يتعامل مع Exceptions بطريقته.
// وده دور الـ Result