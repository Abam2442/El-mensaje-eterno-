import 'dart:convert';
import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_ziped_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../core/constants/app_keys.dart';
import '../../../domain/entities/fixed_entities.dart';

abstract class GuideToIslamLocalDataSource {
  Future<List<FixedEntities>> getContect();
  Future<List<MediaEntity>> getBooks();
  Future<List<MediaEntity>> getAudios();
  Future<List<MediaEntity>> getVideos();
}

class GuideToIslamLocalDataSourceImpl extends GuideToIslamLocalDataSource {
  @override
  Future<List<FixedEntities>> getContect() async {
    try {
      List<FixedEntities> articals = [];
      // First, extract the ZIP file
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.guideToIslam}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();

      // Parse the JSON string
      final jsonData = json.decode(assetData);
      var jsonguide = jsonData['guide-to-islam'][0] as Map;
      jsonguide['Articles'].forEach((key, value) {
        articals.add(FixedEntities(
          name: key,
          content: value,
        ));
      });

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getBooks() async {
    try {
      List<MediaEntity> result = [];

      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.guideToIslamBooks}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();
      // Parse the JSON string
      final jsonData = json.decode(assetData);
      (((jsonData['guide-to-islam']).elementAt(0))['books'] as Map)
          .forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      // }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getAudios() async {
    try {
      List<MediaEntity> result = [];

      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.guideToIslamAudios}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();
      // Parse the JSON string
      final jsonData = json.decode(assetData);
      (((jsonData['guide-to-islam'] as List)[0] as Map)['auidos'] as Map)
          .forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      // }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getVideos() async {
    try {
      List<MediaEntity> result = [];
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.guideToIslamVideos}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();
      // Parse the JSON string
      final jsonData = json.decode(assetData);
      (((jsonData['guide-to-islam'] as List)[0] as Map)['videos'] as Map)
          .forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
