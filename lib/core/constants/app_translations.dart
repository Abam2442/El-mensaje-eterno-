import 'package:get/get.dart';

import 'app_translation_keys.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          AppTranslationKeys.offline:
              'Can`t connect to the internet.\n Please check your network connection and try again later',
          AppTranslationKeys.unexpectedException: 'Unexpected error. Please try again later',
          AppTranslationKeys.internalServerError:
              'Sorry, a server error occurred, the request cannot be executed at this time',
          AppTranslationKeys.notFound: 'Sorry, the requested resource could not be found',
          AppTranslationKeys.forbidden: 'Sorry, you must be logged in to access this resource',
          AppTranslationKeys.unauthorized: 'Sorry, you do not have sufficient permissions to access this resource',
          AppTranslationKeys.badRequest: 'Sorry, the request cannot be processed because it is invalid',
          AppTranslationKeys.success: 'It was done successfully',
          AppTranslationKeys.failure: 'The operation failed',
          AppTranslationKeys.cancel: "Cancel",
          AppTranslationKeys.confirm: 'Confirm',
          AppTranslationKeys.waiting: 'Waiting...',
          AppTranslationKeys.close: 'close',
        },
        'ar': {
          AppTranslationKeys.offline: 'لا يمكن الاتصال بالإنترنت.\n يرجى التحقق من اتصالك بالشبكة وإعادة المحاولة لاحق',
          AppTranslationKeys.unexpectedException: 'خطأ غير متوقع. يرجى إعادة المحاولة لاحق',
          AppTranslationKeys.internalServerError: 'عذراً، حدث خطأ في الخادم، لا يمكن تنفيذ الطلب الآن',
          AppTranslationKeys.notFound: 'عذراً، لا يمكن العثور على المورد المطلوب',
          AppTranslationKeys.forbidden: 'عذراً، يجب عليك تسجيل الدخول للوصول إلى هذا المورد',
          AppTranslationKeys.unauthorized: 'عذراً، ليس لديك الصلاحيات الكافية للوصول إلى هذا المورد',
          AppTranslationKeys.badRequest: 'عذراً، لا يمكن تنفيذ الطلب لأنه غير صالح',
          AppTranslationKeys.success: 'تم الأمر بنجاح',
          AppTranslationKeys.failure: 'فشلت العملية',
          AppTranslationKeys.cancel: "إلغاء",
          AppTranslationKeys.confirm: 'تأكيد',
          AppTranslationKeys.waiting: 'قيد المعالجة',
          AppTranslationKeys.close: 'إغلاق',
        },
      };
}
