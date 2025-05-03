import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_ziped_data.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class NonMuslimLocalDataSource {
  Future<List<NonMuslimModel>> getCourses();
}

class NonMuslimLocalDataSourceImpl extends NonMuslimLocalDataSource {
  @override
  Future<List<NonMuslimModel>> getCourses() async {
      List<NonMuslimModel> hadithes = [];
     try {
      // First, extract the ZIP file
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.nonMuslims}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        log('JSON file not found at: $jsonFilePath');
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();

      // Parse the JSON string
      final jsonResponse = json.decode(assetData);
      hadithes = jsonResponse
          .map<NonMuslimModel>(
            (surah) => NonMuslimModel.fromJson(surah),
          )
          .toList();
    } catch (e) {
      log('Error loading quran: $e');
      rethrow;
    }
  return hadithes;
  }
   
}
