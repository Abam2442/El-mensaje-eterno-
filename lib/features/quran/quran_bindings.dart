import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/network_info.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/data_sources/quran_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/repository/quran_repo_impl.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/repository/quran_repo.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class QuranBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(InternetConnectionChecker.createInstance());
    Get.put(SharedPreferencesService(pref: Get.find()));

    Get.put<NetworkInfo>(NetworkInfoImpl(Get.find()));
    
    Get.put<QuranLocalDataSource>(
      QuranLocalDataSourceImpl(),
    );
    Get.put<QuranRepo>(
      QuranRepoImpl(
        quranLocalDataSource: Get.find(),
      ),
    );

    Get.put(QuranController());
    // Get.put(AudioService());
    // Get.put(SurahController());
  }
}
