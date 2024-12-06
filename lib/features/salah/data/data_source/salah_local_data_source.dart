import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class SalahLocalDataSource {
  Future<List<TaharaLessonModel>> getOfflineData();
}

class SalahLocalDataSourceImpl extends SalahLocalDataSource {
  @override
  Future<List<TaharaLessonModel>> getOfflineData() async {
    try {
      log('local Data');
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/Drossalaa.json';
      final file = File(filePath);
      String jsonString = await file.readAsString();
      final jsonResponse = json.decode(jsonString)['Muslim'];
      return await jsonResponse
          .map<TaharaLessonModel>(TaharaLessonModel.fromjson)
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
