import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/download_services.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';

import 'core/helpers/network_info.dart';
import 'core/services/api_service.dart';
import 'core/services/easy_loader_service.dart';
import 'core/services/shared_preferences_service.dart';

class InitialBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(Logger());
    Get.put(EasyLoaderService());

    Get.put(SharedPreferencesService(pref: Get.find()));
    Get.put(ArchiveService(sharedPreferencesService: Get.find()));
    Get.put(InternetConnectionChecker());
    Get.put<NetworkInfo>(NetworkInfoImpl(Get.find()));
    Get.put(
      ApiService(
        client: http.Client(),
        networkInfo: Get.find(),
      ),
    );

    Get.lazyPut(() => DownloadServices());
  }
}
