import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:hiwayda_oracion_islamica/features/quran/data/models/surah_model.dart';
// import '';

abstract class QuranRemoteDataSource {
  Future<List<SurahModel>> getData();
}

class QuranRemoteDataSourceImp extends QuranRemoteDataSource {
  @override
  Future<List<SurahModel>> getData() async {
    try {
      // log(14444);
      // print('remotesfasdf');
      final response =
          await http.get(Uri.parse('${AppApiRoutes.jsonApi}quran.json'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = jsonDecode(jsonString);
      return finalData
          .map<SurahModel>(
            (surah) => SurahModel.fromJson(surah),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
