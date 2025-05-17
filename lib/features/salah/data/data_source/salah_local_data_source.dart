import 'dart:convert';
import 'dart:developer';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';

abstract class SalahLocalDataSource {
  Future<List<TaharaLessonModel>> getOfflineData();
}

class SalahLocalDataSourceImpl extends SalahLocalDataSource {
  @override
  Future<List<TaharaLessonModel>> getOfflineData() async {
    try {
      log('remote Data');
      final response =await getAssetsData('Drossalaa.json');
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
