
import '../constants/app_translation_keys.dart';
import '../errors/exception.dart';
import '../errors/failures.dart';

Failure getFailureFromException(Object exception) {
  if (exception is BadRequestException) {
    return BadRequestFailure(message: exception.message);
  } else if (exception is UnAuthenticatedException) {
    return const UnAuthenticatedFailure(message: AppTranslationKeys.forbidden);
  } else if (exception is UnAuthorizedException) {
    return const UnAuthorizedFailure(message: AppTranslationKeys.unauthorized);
  } else if (exception is NotFoundException) {
    return const NotFoundFailure(message: AppTranslationKeys.notFound);
  } else if (exception is InternalServerErrorException) {
    return const InternalServerErrorFailure(
      message: AppTranslationKeys.internalServerError,
    );
  } else if (exception is OfflineException) {
    return const OfflineFailure(message: AppTranslationKeys.offline);
  } else {
    
    return const UnexpectedFailure(
      message: AppTranslationKeys.unexpectedException,
    );
  }
}
