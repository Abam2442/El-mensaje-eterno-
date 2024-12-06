import 'dart:convert';
import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/models/surah_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class AdvancedLearningLocalDataSource {
  Future<List<SurahModel>> getSurahs();
}

class AdvancedLearningLocalDataSourceImpl
    extends AdvancedLearningLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  AdvancedLearningLocalDataSourceImpl({
    required this.sharedPreferencesService,
  });

  @override
  Future<List<SurahModel>> getSurahs() async {
    try {
      List<SurahModel> surahs = [];
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/quran.json';
      final file = File(filePath);
      String jsonString = await file.readAsString();
      final jsonResponse = json.decode(jsonString);
      surahs = jsonResponse
          .map<SurahModel>(
            (surah) => SurahModel.fromJson(surah),
          )
          .toList();

      return surahs;
    } catch (e) {
      rethrow;
    }
  }
}
