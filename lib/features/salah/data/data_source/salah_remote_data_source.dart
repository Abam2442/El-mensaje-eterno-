import 'dart:convert';
import 'dart:developer';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';
import 'package:http/http.dart' as http;

abstract class SalahRemoteDataSource {
  Future<List<TaharaLessonModel>> getOnlineData();
}

class SalahRemoteDataSourceImpl extends SalahRemoteDataSource {
  @override
  Future<List<TaharaLessonModel>> getOnlineData() async {
    try {
      log('remote Data');
      final response =
          await http.get(Uri.parse('${AppApiRoutes.jsonApi}Drossalaa.json'));
      print(response.body);
      final data =
          await json.decode(utf8.decode(response.bodyBytes))['Muslim '];
      print(data);
      return await data
          .map<TaharaLessonModel>(TaharaLessonModel.fromjson)
          .toList();
    } catch (e) {
      print({e});
      rethrow;
    }
  }
}
