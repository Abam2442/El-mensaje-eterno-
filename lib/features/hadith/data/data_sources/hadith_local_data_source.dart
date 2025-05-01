import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_ziped_data.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/model/sunnah_data_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class HadithLocalDataSource {
  Future<List<SunnahHadithModel>> getHadithes();
  Future<List<SunnahDataModel>> getSunnah(String path);
}

class HadithLocalDataSourceImpl extends HadithLocalDataSource {
  @override
  Future<List<SunnahHadithModel>> getHadithes() async {
    try {
      // First, extract the ZIP file
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.hadith}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        log('JSON file not found at: $jsonFilePath');
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();

      // Parse the JSON string
      final jsonResponse = json.decode(assetData);

      List<SunnahHadithModel> sunnahHadithes = [];

      // Process the JSON data if it's not empty
      if (jsonResponse != null) {
        // Check if jsonResponse is already a Map or if it's a String that needs decoding
        Map jsonData;

        if (jsonResponse is String) {
          // Only decode again if the response is a String (which is unusual)
          jsonData = json.decode(jsonResponse);
        } else if (jsonResponse is Map) {
          // Use it directly if it's already a Map
          jsonData = jsonResponse;
        } else {
          log('Unexpected JSON format: ${jsonResponse.runtimeType}');
          return [];
        }

        // Convert JSON to models
        sunnahHadithes = jsonData.entries
            .map((entry) => SunnahHadithModel.fromJson(entry.value, entry.key))
            .toList();

        log('get hadithes ${sunnahHadithes.length}');
      }

      return sunnahHadithes;
    } catch (e) {
      log('Error loading hadithes: $e');
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
