import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_ziped_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../core/constants/app_keys.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../models/knowing_allah_model.dart';

abstract class KnowingAllahLocalDataSource {
  Future<List<KnowingAllahSubCategoryModel>> getContent();
  Future<List<MediaEntity>> getBooks();
  Future<List<MediaEntity>> getAudios();
  Future<List<MediaCategoryEntity>> getVideos();
}

class KnowingAllahLocalDataSourceImp extends KnowingAllahLocalDataSource {
  @override
  Future<List<KnowingAllahSubCategoryModel>> getContent() async {
    try {
      List<KnowingAllahSubCategoryModel> articles = [];
      // First, extract the ZIP file
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.knowingAllah}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        log('JSON file not found at: $jsonFilePath');
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();

      // Parse the JSON string
      final jsonData = json.decode(assetData);
      jsonData['knowing-Allah']['Articles'].forEach((key, value) {
        List<FixedEntities> subCatigory = [];
        value.forEach((key, value) {
          subCatigory.add(FixedEntities(name: key, content: value));
        });
        articles.add(KnowingAllahSubCategoryModel(
          name: key,
          subcategories: subCatigory,
        ));
      });
      return Future.value(articles);
    } catch (e) {
      log('Error loading kowning allah: $e');
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getBooks() async {
    try {
      List<MediaEntity> result = [];

      // First, extract the ZIP file
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.knowingAllahBooks}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        log('JSON file not found at: $jsonFilePath');
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();

      // Parse the JSON string
      final jsonData = json.decode(assetData);
      (jsonData['knowing-Allah']['Books'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      log('Error loading kowning allah: $e');
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getAudios() async {
    try {
      List<MediaEntity> result = [];
      // First, extract the ZIP file
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.knowingAllahAudios}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        log('JSON file not found at: $jsonFilePath');
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();

      // Parse the JSON string
      final jsonData = json.decode(assetData);
      (jsonData['knowing-Allah']['Audios'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      log('Error loading kowning allah: $e');
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getVideos() async {
    try {
      List<MediaCategoryEntity> result = [];
      final String extractedDir = await extractZip(
          zipPath: 'assets/Json.zip',
          destinationDir: await getTemporaryDirectory()
              .then((dir) => '${dir.path}/extracted_json'));

      // Load the JSON file from the extracted directory
      final String jsonFilePath = '$extractedDir/${AppKeys.knowingAllahVideos}';
      final File jsonFile = File(jsonFilePath);

      if (!await jsonFile.exists()) {
        log('JSON file not found at: $jsonFilePath');
        return [];
      }

      // Read the JSON data from the extracted file
      final String assetData = await jsonFile.readAsString();

      // Parse the JSON string
      final jsonData = json.decode(assetData);
      (jsonData['knowing-Allah']['Videos'] as Map).forEach((category, dataMap) {
        List<MediaEntity> data = [];
        (dataMap as Map).forEach((name, url) {
          data.add(MediaEntity(name: name, url: url));
        });
        result.add(MediaCategoryEntity(category: category, data: data));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
