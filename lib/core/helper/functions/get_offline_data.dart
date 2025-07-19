import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_ziped_data.dart';

Future<Map<String, dynamic>> getOfflineData(String fileName) async {
  final String extractedDir = await extractZip(
    zipPath: 'assets/Json.zip',
    destinationDir: await getTemporaryDirectory()
        .then((dir) => '${dir.path}/extracted_json'),
  );

  final String jsonFilePath = '$extractedDir/$fileName';

  final  jsonData =
      await compute(readAndParseJsonInIsolate, jsonFilePath);

  return jsonData;
}
Future readAndParseJsonInIsolate(String filePath) async {
  final File jsonFile = File(filePath);
  if (!await jsonFile.exists()) {
    return {};
  }
  final String assetData = await jsonFile.readAsString();
  return json.decode(assetData);
}