import 'package:hiwayda_oracion_islamica/core/services/audio_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/data_sources/ayat_audio_remote_source.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/data_sources/quran_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/data_sources/quran_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/repository/quran_repo_impl.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/repository/quran_repo.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/surrah_controller.dart';

class QuranBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<QuranRemoteDataSource>(
      QuranRemoteDataSourceImpl(apiService: Get.find()),
    );
    Get.put<QuranLocalDataSource>(
      QuranLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService: Get.find(),
      ),
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
    Get.put(AudioService());
    Get.put(SurahController());
     
  }
}