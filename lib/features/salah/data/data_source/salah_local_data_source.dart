import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';

abstract class SalahLocalDataSource {
  Future<List<TaharaLessonModel>> getOfflineData();
}

class SalahLocalDataSourceImpl extends SalahLocalDataSource {
  @override
  Future<List<TaharaLessonModel>> getOfflineData() async {
    try {
       final response = await rootBundle.loadString('assets/json/Drossalaa.json');
     final Map<String, dynamic> jsonMap = jsonDecode(response);
     final List<dynamic> data = jsonMap['Muslim ']; 
     return data
      .map((item) => TaharaLessonModel.fromjson(item as Map<String, dynamic>))
      .toList();
    } catch (e) {
      print({e});
      rethrow;
    }
  }
}
