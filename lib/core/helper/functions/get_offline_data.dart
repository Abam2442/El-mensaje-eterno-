import 'dart:convert';
import 'dart:io';

import 'package:hiwayda_oracion_islamica/core/helper/functions/get_ziped_data.dart';
import 'package:path_provider/path_provider.dart';
/// get Offline Data from json.zip file 
Future getOfflineData(String fileName) async {
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      final String jsonFilePath = '$extractedDir/$fileName';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        return [];
      }
      final String assetData = await jsonFile.readAsString();
     return json.decode(assetData);
}
