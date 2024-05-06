import 'dart:convert';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/entities/islam_land_entities.dart';

abstract class IslamLandLocalDataSource {
  Future<List<List<FixedEntities>>> getContent();
  Future<List<IslamLandFatwaEntities>> getFatwa();
  Future<Map<String, List<FixedEntities>>> getBooks();
}

class IslamLandLocalDataSourceImpl extends IslamLandLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  IslamLandLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<List<FixedEntities>>> getContent() async {
    try {
      Get.find<Logger>()
          .i("Start `getContent` in |IslamLandLocalDataSourceImpl|");
      String? islamLandJson =
          await archiveService.readFile(name: AppKeys.islamLand);
      List<FixedEntities> videos = [];
      List<FixedEntities> audios = [];
      List<FixedEntities> articals = [];
      List<FixedEntities> articalsOn = [];
      List<FixedEntities> fatwasOn = [];

      if (islamLandJson != null) {
        var jsonData = json.decode(islamLandJson);
        jsonData['islam-Land']['Videos'].forEach((key, value) {
          videos.add(FixedEntities(name: key, content: value));
        });
      }

      if (islamLandJson != null) {
        var jsonData = json.decode(islamLandJson);
        jsonData['islam-Land']['Audios'].forEach((key, value) {
          audios.add(FixedEntities(name: key, content: value));
        });
      }

      if (islamLandJson != null) {
        var jsonData = json.decode(islamLandJson);
        jsonData['islam-Land']['Articles'].forEach((key, value) {
          articals.add(FixedEntities(name: key, content: value));
        });
      }

      if (islamLandJson != null) {
        var jsonData = json.decode(islamLandJson);
        jsonData['islam-Land']['Articles Online'].forEach((key, value) {
          articalsOn.add(FixedEntities(name: key, content: value));
        });
      }

      if (islamLandJson != null) {
        var jsonData = json.decode(islamLandJson);
        jsonData['islam-Land']['Fatwas Online'].forEach((key, value) {
          fatwasOn.add(FixedEntities(name: key, content: value));
        });
      }
      Get.find<Logger>()
          .w("End `getContent` in |IslamLandLocalDataSourceImpl|");
      return Future.value([videos, audios, articals, articalsOn, fatwasOn]);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getContent` in |IslamLandLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, List<FixedEntities>>> getBooks() async {
    try {
      Get.find<Logger>()
          .i("Start `getBooks` in |IslamLandLocalDataSourceImpl|");
      Map<String, List<FixedEntities>> result = {};
      String? islamLandJson =
          await archiveService.readFile(name: AppKeys.islamLandBooks);
      if (islamLandJson != null) {
        Map<String, dynamic> decoded = jsonDecode(islamLandJson);

        decoded.forEach((bookCategory, value) {
          result[bookCategory] = [];
          for (Map booksMap in value) {
            booksMap.forEach((bookName, content) {
              FixedEntities bookEnitie =
                  FixedEntities(name: bookName, content: content);
              result[bookCategory]!.add(bookEnitie);
            });
          }
        });
      }
      return result;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getBooks` in |IslamLandLocalDataSourceImpl| Exception: ${e.runtimeType} $e",
      );
      rethrow;
    }
  }

  @override
  Future<List<IslamLandFatwaEntities>> getFatwa() async {
    try {
      Get.find<Logger>()
          .i("Start `getFatwa` in |IslamLandLocalDataSourceImpl|");
      String? islamLandJson =
          await archiveService.readFile(name: AppKeys.islamLand);
      List<IslamLandFatwaEntities> fatwas = [];
      if (islamLandJson != null) {
        var jsonData = json.decode(islamLandJson);
        jsonData['islam-Land']['Fatawas'].forEach((key, value) {
          fatwas.add(IslamLandFatwaEntities(
              title: key,
              question: value['question'],
              answer: value['answer']));
        });
      }
      Get.find<Logger>().w("End `getFatwa` in |IslamLandLocalDataSourceImpl|");
      return Future.value(fatwas);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getFatwa` in |IslamLandLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
