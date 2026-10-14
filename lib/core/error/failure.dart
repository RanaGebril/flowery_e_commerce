// is result Error --> define the error type

sealed class Failure {
  final String messageKey;
  final String? serverMessage;
  const Failure(this.messageKey,{this.serverMessage});
}

class NetworkFailure extends Failure {
  const NetworkFailure()
      : super('noInternetConnection');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure()
      : super('requestTimeout');
}

class ServerFailure extends Failure {
  const ServerFailure({String? serverMessage})
      : super('serverError',serverMessage: serverMessage);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure()
      : super('unauthorized');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure()
      : super('notFound');
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure()
      : super('unexpectedError');
}
