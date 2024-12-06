import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/network_info.dart';
import 'package:hiwayda_oracion_islamica/core/services/api_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/data_sources/ayat_audio_remote_source.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/data_sources/quran_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/data_sources/quran_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/repository/quran_repo_impl.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/repository/quran_repo.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

class QuranBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(InternetConnectionChecker());
    Get.put(SharedPreferencesService(pref: Get.find()));

    Get.put<NetworkInfo>(NetworkInfoImpl(Get.find()));
    Get.put(
      ApiService(
        client: http.Client(),
        networkInfo: Get.find(),
      ),
    );
    Get.put<QuranRemoteDataSource>(
      QuranRemoteDataSourceImp(),
    );
    Get.put<QuranLocalDataSource>(
      QuranLocalDataSourceImpl(),
    );
    Get.put<QuranRepo>(
      QuranRepoImpl(
        quranRemoteDataSource: Get.find(),
        quranLocalDataSource: Get.find(),
      ),
    );
    Get.put<AyatAudioRemoteDataSource>(
      AyatAudioRemoteDataSourceImpl(apiService: Get.find()),
    );

    Get.put(QuranController());
    // Get.put(AudioService());
    // Get.put(SurahController());
  }
}
