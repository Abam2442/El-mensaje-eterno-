import 'dart:convert';
import 'dart:developer';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/models/surah_model.dart';

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
      print('start');
      //
      String? quranJson = await archiveService.readFile(name: AppKeys.quran);

      // log('quran json file is  ${AppKeys.quran}');
      // log('quran json file is  $quranJson');
      List<SurahModel> surahs = [];
      if (quranJson != null) {
        // log('success');
        List jsonData = json.decode(quranJson);
        print(jsonData);
        surahs = jsonData
            .map<SurahModel>(
              (surah) => SurahModel.fromJson(surah),
            )
            .toList();
        // surahs = jsonData.
        log('success');
      }

      //
      return Future.value(surahs);
    } catch (e) {
      log(e.toString());
      //
      //
      // );
      rethrow;
    }
  }
}
