import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/models/surah_model.dart';

abstract class QuranLocalDataSource {
  Future<List<SurahModel>> getSurahs();
}

class QuranLocalDataSourceImpl extends QuranLocalDataSource {
  @override
  Future<List<SurahModel>> getSurahs() async {
    try {
      String? quranJson = await rootBundle.loadString('assets/json/quran.json');
      print({quranJson});

      List<SurahModel> surahs = [];
      if (quranJson.isNotEmpty) {
        List jsonData = json.decode(quranJson);
        print({jsonData});
        surahs = jsonData
            .map<SurahModel>(
              (surah) => SurahModel.fromJson(surah),
            )
            .toList();
        log('success');
      } else {
        log('error');
      }

      return surahs;
    } catch (e) {
      log(e.toString());
      //
      //
      // );
      rethrow;
    }
  }
}
