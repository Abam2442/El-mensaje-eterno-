import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_ziped_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/islam_for_christians_entities.dart';
import 'package:path_provider/path_provider.dart';

abstract class IslamForChristiansLocalDataSource {
  Future<List<IslamForChristiansEntities>> getContent();
}

class IslamForChristiansLocalDataSourceImp
    extends IslamForChristiansLocalDataSource {
  @override
  Future<List<IslamForChristiansEntities>> getContent() async {
    List<IslamForChristiansEntities> articals = [];
    try {
      // First, extract the ZIP file
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.islamForChristians}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        log('JSON file not found at: $jsonFilePath');
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();

      // Parse the JSON string
      final jsonData = json.decode(assetData);
      jsonData['islam-for-christians'].forEach((key, value) {
        List<FixedEntities> subCatigory = [];

        jsonData['islam-for-christians'][key].forEach((key, value) {
          subCatigory.add(FixedEntities(name: key, content: value));
        });
        articals.add(IslamForChristiansEntities(
          name: key,
          subCatigory: subCatigory,
        ));
      });
    } catch (e) {
      log('Error loading terminology: $e');
      rethrow;
    }
    return Future.value(articals);
  }
}
