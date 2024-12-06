import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:http/http.dart' as http;
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/model/sunnah_data_model.dart';

abstract class HadithRemoteDataSource {
  Future<List<SunnahHadithModel>> getOnlineHadithData();
  Future<List<SunnahDataModel>> getOnlineSunnahData(String fileName);
}

class HadithRemoteDataSourceImpl extends HadithRemoteDataSource {
  @override
  Future<List<SunnahHadithModel>> getOnlineHadithData() async {
    try {
      final response =
          await http.get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.hadith}'));
      final jsonString = utf8.decode(response.bodyBytes);
      List<SunnahHadithModel> sunnahHadithes = [];
      var finalData = await json.decode(jsonString) as Map<String, dynamic>;
      sunnahHadithes = finalData.entries
          .map((entry) => SunnahHadithModel.fromJson(entry.value, entry.key))
          .toList();
      return sunnahHadithes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SunnahDataModel>> getOnlineSunnahData(String fileName) async {
    try {
      final response =
          await http.get(Uri.parse('${AppApiRoutes.jsonApi}$fileName'));
      final jsonString = utf8.decode(response.bodyBytes);
      List finalData = await json.decode(jsonString);
      final ref = finalData
          .map((element) => SunnahDataModel.fromjson(element))
          .toList();
      return ref;
    } catch (e) {
      rethrow;
    }
  }
}
