import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hiwayda_oracion_islamica/core/helper/functions/get_ziped_data.dart';
import 'package:hiwayda_oracion_islamica/features/quran/data/models/surah_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class QuranLocalDataSource {
  Future<List<SurahModel>> getSurahs();
}

class QuranLocalDataSourceImpl extends QuranLocalDataSource {
  @override
  Future<List<SurahModel>> getSurahs() async {
    List<SurahModel> surahs = [];
    try {
      // First, extract the ZIP file
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/quran.json';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        log('JSON file not found at: $jsonFilePath');
        return [];
      }
      final String assetData = await jsonFile.readAsString();
      final jsonResponse = json.decode(assetData);
      surahs = jsonResponse
          .map<SurahModel>(
            (surah) => SurahModel.fromJson(surah),
          )
          .toList();
    } catch (e) {
      log('Error loading quran: $e');
      rethrow;
    }
    return surahs;
  }
}
