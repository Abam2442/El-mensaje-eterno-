import 'dart:convert';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class IslamHouseLocalDataSource {
  Future<List<List<FixedEntities>>> getContect();
  Future<List<MediaEntity>> getBooks();
  Future<List<FixedEntities>> getFatwa();
}

class IslamHouseLocalDataSourceImpl extends IslamHouseLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  IslamHouseLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<List<FixedEntities>>> getContect() async {
    try {
      Get.find<Logger>()
          .i("Start `getContect` in |IslamHouseLocalDataSourceImpl|");
      String? islamHouseJson =
          await archiveService.readFile(name: AppKeys.islamHouse);
      List<FixedEntities> videos = [];
      List<FixedEntities> audios = [];
      List<FixedEntities> books = [];
      List<FixedEntities> fatwas = [];
      List<FixedEntities> articals = [];
      if (islamHouseJson != null) {
        var jsonData = json.decode(islamHouseJson);
        jsonData['islam-house']['Videos'].forEach((key, value) {
          videos.add(FixedEntities(
            name: key,
            content: value,
          ));
        });

        jsonData['islam-house']['Audios'].forEach((key, value) {
          audios.add(FixedEntities(
            name: key,
            content: value,
          ));
        });

        jsonData['islam-house']['Books'].forEach((key, value) {
          books.add(FixedEntities(
            name: key,
            content: value,
          ));
        });

        jsonData['islam-house']['Fatwa'].forEach((key, value) {
          fatwas.add(FixedEntities(
            name: key,
            content: value,
          ));
        });

        jsonData['islam-house']['Articles'].forEach((key, value) {
          articals.add(FixedEntities(
            name: key,
            content: value,
          ));
        });
      }
      Get.find<Logger>()
          .w("End `getContect` in |IslamHouseLocalDataSourceImpl|");
      return Future.value([videos, audios, books, fatwas, articals]);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getContect` in |IslamHouseLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getBooks() async {
    try {
      Get.find<Logger>()
          .i("Start `getBooks` in |IslamHouseLocalDataSourceImpl|");
      List<MediaEntity> result = [];
      String? json =
          await archiveService.readFile(name: AppKeys.islamHouseBooks);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);

        (decoded['islam-house']['Books'] as Map).forEach((name, url) {
          result.add(MediaEntity(name: name, url: url));
        });
      }
      return result;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getBooks` in |IslamLandHouseDataSourceImpl| Exception: ${e.runtimeType} $e",
      );
      rethrow;
    }
  }

  @override
  Future<List<FixedEntities>> getFatwa() async {
    try {
      Get.find<Logger>()
          .i("Start `getFatwa` in |IslamHouseLocalDataSourceImpl|");
      List<FixedEntities> result = [];
      String? json =
          await archiveService.readFile(name: AppKeys.islamHouseFatwa);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);

        (decoded['islam-house']['Fatwa'] as Map).forEach((name, content) {
          result.add(FixedEntities(name: name, content: content));
        });
      }
      return result;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getFatwa` in |IslamLandHouseDataSourceImpl| Exception: ${e.runtimeType} $e",
      );
      rethrow;
    }
  }
}
