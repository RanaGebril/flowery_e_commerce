// is result Error --> define the error type

import 'package:easy_localization/easy_localization.dart';

sealed class Failure {
  final String messageKey;

  const Failure(this.messageKey);
}

class NetworkFailure extends Failure {
   NetworkFailure()
      : super('noInternetConnection'.tr());
}

class TimeoutFailure extends Failure {
   TimeoutFailure()
      : super('requestTimeout'.tr());
}

class ServerFailure extends Failure {
   ServerFailure()
      : super('serverError'.tr());
}

class UnauthorizedFailure extends Failure {
   UnauthorizedFailure()
      : super('unauthorized'.tr());
}

class NotFoundFailure extends Failure {
   NotFoundFailure()
      : super('notFound'.tr());
}

class UnexpectedFailure extends Failure {
   UnexpectedFailure()
      : super('unexpectedError'.tr());
}
