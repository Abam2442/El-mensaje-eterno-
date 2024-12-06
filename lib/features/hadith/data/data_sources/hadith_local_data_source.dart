import 'dart:convert';
import 'dart:io';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/model/sunnah_data_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class HadithLocalDataSource {
  Future<List<SunnahHadithModel>> getHadithes();
  Future<List<SunnahDataModel>> getSunnah(String path);
}

class HadithLocalDataSourceImpl extends HadithLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  HadithLocalDataSourceImpl({
    required this.sharedPreferencesService,
  });

  @override
  Future<List<SunnahHadithModel>> getHadithes() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${AppKeys.hadith}';
      final file = File(filePath);
      String jsonString = await file.readAsString();
      List<SunnahHadithModel> sunnahHadithes = [];
      if (jsonString.isNotEmpty) {
        var jsonData = await json.decode(jsonString) as Map<String, dynamic>;
        sunnahHadithes = jsonData.entries
            .map((entry) => SunnahHadithModel.fromJson(entry.value, entry.key))
            .toList();
      }
      return sunnahHadithes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SunnahDataModel>> getSunnah(String path) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${AppKeys.hadith}';
      final file = File(filePath);
      String jsonString = await file.readAsString();
      List data = json.decode(jsonString);
      final ref =
          data.map((element) => SunnahDataModel.fromjson(element)).toList();
      return ref;
    } catch (e) {
      rethrow;
    }
  }
}
