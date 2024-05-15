import 'dart:convert';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/fixed_entities.dart';
import '../models/knowing_allah_model.dart';

abstract class KnowingAllahLocalDataSource {
  Future<KnowingAllahModel> getContent();
  Future<List<MediaEntity>> getBooks();
  Future<List<MediaEntity>> getAudios();
  Future<List<MediaCategoryEntity>> getVideos();
}

class KnowingAllahLocalDataSourceImp extends KnowingAllahLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  KnowingAllahLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<KnowingAllahModel> getContent() async {
    Get.find<Logger>()
        .i("Start `getContent` in |KnowingAllahLocalDataSourceImp|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.knowingAllah);
    // List<IslamReligionEntities> articals = [];
    List<KnowingAllahSubCategoryModel> videos = [];
    List<KnowingAllahSubCategoryModel> audios = [];
    List<KnowingAllahSubCategoryModel> books = [];
    List<KnowingAllahSubCategoryModel> articles = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);

      jsonData['knowing-Allah']['Videos'].forEach((key, value) {
        List<FixedEntities> subCatigory = [];
        value.forEach((key, value) {
          // print(value);/
          // value.forEach((key, value) {
          //   // print(value);

          // });
          subCatigory.add(FixedEntities(name: key, content: value));
        });
        videos.add(KnowingAllahSubCategoryModel(
          name: key,
          subcategories: subCatigory,
        ));
        // articals.add(IslamReligionEntities(
        //   name: key,
        //   catigory: catigory,
        // ));
      });
      jsonData['knowing-Allah']['Audios'].forEach((key, value) {
        List<FixedEntities> subCatigory = [];
        value.forEach((key, value) {
          // value.forEach((key, value) {
          // });
          subCatigory.add(FixedEntities(name: key, content: value));
        });
        // articals.add(IslamReligionEntities(
        //   name: key,
        audios.add(KnowingAllahSubCategoryModel(
          name: key,
          subcategories: subCatigory,
        ));
        //   catigory: catigory,
        // ));
      });
      jsonData['knowing-Allah']['Books'].forEach((key, value) {
        // value.forEach((key, value) {
        List<FixedEntities> subCatigory = [];
        // value.forEach((key, value) {
        // });
        subCatigory.add(FixedEntities(name: key, content: value));
        books.add(KnowingAllahSubCategoryModel(
          name: key,
          subcategories: subCatigory,
        ));
        // });
        // articals.add(IslamReligionEntities(
        //   name: key,
        //   catigory: catigory,
        // ));
      });
      jsonData['knowing-Allah']['Articles'].forEach((key, value) {
        List<FixedEntities> subCatigory = [];
        value.forEach((key, value) {
          // value.forEach((key, value) {
          // });
          subCatigory.add(FixedEntities(name: key, content: value));
        });
        articles.add(KnowingAllahSubCategoryModel(
          name: key,
          subcategories: subCatigory,
        ));
        // articals.add(IslamReligionEntities(
        //   name: key,
        //   catigory: catigory,
        // ));
      });
    }
    var knowingAllah = KnowingAllahModel(
        videos: videos, audios: audios, books: books, articles: articles);
    Get.find<Logger>()
        .w("End `getContent` in |KnowingAllahLocalDataSourceImp|");
    return Future.value(knowingAllah);
  }

  @override
  Future<List<MediaEntity>> getBooks() async {
    try {
      Get.find<Logger>().i("Start `getBooks` in |KnowingAllahDataSourceImpl|");
      List<MediaEntity> result = [];
      String? json =
          await archiveService.readFile(name: AppKeys.knowingAllahBooks);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);

        (decoded['knowing-Allah']['Books'] as Map).forEach((name, url) {
          result.add(MediaEntity(name: name, url: url));
        });
      }
      return result;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getBooks` in |KnowingAllahDataSourceImpl| Exception: ${e.runtimeType} $e",
      );
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getAudios() async {
    try {
      Get.find<Logger>().i("Start `getAudios` in |KnowingAllahDataSourceImpl|");
      List<MediaEntity> result = [];
      String? json =
          await archiveService.readFile(name: AppKeys.knowingAllahAudios);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);

        (decoded['knowing-Allah']['Audios'] as Map).forEach((name, url) {
          result.add(MediaEntity(name: name, url: url));
        });
      }
      return result;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getAudios` in |KnowingAllahDataSourceImpl| Exception: ${e.runtimeType} $e",
      );
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getVideos() async {
    try {
      Get.find<Logger>().i("Start `getVideos` in |KnowingAllahDataSourceImpl|");
      List<MediaCategoryEntity> result = [];
      String? json =
          await archiveService.readFile(name: AppKeys.knowingAllahVideos);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);

        (decoded['knowing-Allah']['Videos'] as Map)
            .forEach((category, dataMap) {
          List<MediaEntity> data = [];
          (dataMap as Map).forEach((name, url) {
            data.add(MediaEntity(name: name, url: url));
          });
          result.add(MediaCategoryEntity(category: category, data: data));
        });
      }
      return result;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getVideos` in |KnowingAllahDataSourceImpl| Exception: ${e.runtimeType} $e",
      );
      rethrow;
    }
  }
}
