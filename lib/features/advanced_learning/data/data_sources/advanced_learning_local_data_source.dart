import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/models/surah_model.dart';

abstract class AdvancedLearningLocalDataSource {
  Future<List<SurahModel>> getSurahs();
}

class AdvancedLearningLocalDataSourceImpl
    extends AdvancedLearningLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  AdvancedLearningLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<SurahModel>> getSurahs() async {
    try {
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

      return Future.value(surahs);
    } catch (e) {
      rethrow;
    }
  }
}
