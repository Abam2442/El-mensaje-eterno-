import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_ziped_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:path_provider/path_provider.dart';

abstract class TerminologyLocalDataSource {
  Future<List<CategoryFixedEntity>> getArtical();
}

class TerminologyLocalDataSourceImp extends TerminologyLocalDataSource {
  @override
  Future<List<CategoryFixedEntity>> getArtical() async {
    List<CategoryFixedEntity> articals = [];
     try {
      // First, extract the ZIP file
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.terminology}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        log('JSON file not found at: $jsonFilePath');
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();

      // Parse the JSON string
      final jsonData = json.decode(assetData);
      jsonData.forEach((key, value) {
      List<FixedEntities> categoryFixedEntityData = [];
      value.forEach((key, value) => categoryFixedEntityData
          .add(FixedEntities(name: key, content: value)));

      articals.add(
          CategoryFixedEntity(category: key, data: categoryFixedEntityData));
    });
    } catch (e) {
      log('Error loading terminology: $e');
      rethrow;
    }
    
    return Future.value(articals);
  }
}
