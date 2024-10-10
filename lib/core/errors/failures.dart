
abstract class Failure{
  final String message;

  const Failure({required this.message});
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({required super.message});
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure({required super.message});
}

class UnAuthenticatedFailure extends Failure {
  const UnAuthenticatedFailure({required super.message});
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({required super.message});
}

class InternalServerErrorFailure extends Failure {
  const InternalServerErrorFailure({required super.message});
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message});
}

class OfflineFailure extends Failure {
  const OfflineFailure({required super.message});
}
