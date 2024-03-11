import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/models/surah_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class QuranLocalDataSource {
  Future<List<SurahModel>> getSurahs();
}

class QuranLocalDataSourceImpl extends QuranLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  QuranLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<SurahModel>> getSurahs() async {
    try {
      Get.find<Logger>().i("Start `getSurahs` in |QuranLocalDataSourceImpl|");
      String? quranJson = await archiveService.readFile(name: AppKeys.quran);
      List<SurahModel> surahs = [];
      if (quranJson != null) {
        var jsonData = json.decode(quranJson);
        surahs = jsonData
            .map<SurahModel>(
              (surah) => SurahModel.fromJson(surah),
            )
            .toList();
      }
      Get.find<Logger>().w("End `getSurahs` in |QuranLocalDataSourceImpl|");
      return Future.value(surahs);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getSurahs` in |QuranLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
