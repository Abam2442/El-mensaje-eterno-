import 'package:get/get.dart';

setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'lang': Get.locale!.languageCode.toString(),
    };
