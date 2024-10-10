class BadRequestException implements Exception {
  final String message;
  BadRequestException({required this.message});
}

class UnAuthorizedException implements Exception {}

class UnAuthenticatedException implements Exception {}

class NotFoundException implements Exception {}

class InternalServerErrorException implements Exception {}

class UnexpectedException implements Exception {}

class OfflineException implements Exception {}
