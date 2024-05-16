import 'dart:convert';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/books_list_model.dart'
    as models;
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../models/islam_message_model.dart';

abstract class IslamMessageLocalDataSource {
  Future<List<IslamMessageArticalModel>> getArtical();
  Future<List<MediaCategoryEntity>> getBook();
  Future<List<MediaEntity>> getAudio();
}

class IslamMessageLocalDataSourceImpl extends IslamMessageLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  IslamMessageLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<IslamMessageArticalModel>> getArtical() async {
    try {
      Get.find<Logger>()
          .i("Start `getArtical` in |IslamMessageLocalDataSourceImpl|");
      String? islamMessageJson =
          await archiveService.readFile(name: AppKeys.islamMessage);
      List<IslamMessageArticalModel> articals = [];
      if (islamMessageJson != null) {
        var jsonData = json.decode(islamMessageJson);
        articals = jsonData['islam-message']['articlesCategories']
            .map<IslamMessageArticalModel>(
              (artical) => IslamMessageArticalModel.fromJson(artical),
            )
            .toList();
      }
      Get.find<Logger>()
          .w("End `getArtical` in |IslamMessageLocalDataSourceImpl|");
      return Future.value(articals);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getArtical` in |IslamMessageLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getAudio() async {
    try {
      Get.find<Logger>()
          .i("Start `getAudio` in |IslamMessageLocalDataSourceImpl|");
      String? islamMessageJson =
          await archiveService.readFile(name: AppKeys.islamMessageAudios);
      List<MediaEntity> audios = [];
      if (islamMessageJson != null) {
        var jsonData = json.decode(islamMessageJson);
        audios = jsonData['islam-message']['audios']
            .map<MediaEntity>(
              (json) => MediaEntity(url: json['link'], name: json['title']),
            )
            .toList();
      }
      Get.find<Logger>()
          .w("End `getAudio` in |IslamMessageLocalDataSourceImpl|");
      return Future.value(audios);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getAudio` in |IslamMessageLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getBook() async {
    try {
      Get.find<Logger>()
          .i("Start `getBook` in |IslamMessageLocalDataSourceImpl|");
      String? islamMessageJson =
          await archiveService.readFile(name: AppKeys.islamMessageBooks);
      List<models.IslamMessageBookModel> books = [];
      if (islamMessageJson != null) {
        var jsonData = json.decode(islamMessageJson);
        books = jsonData['islam-message']['booksCategories']
            .map<models.IslamMessageBookModel>(
              (bookListJson) =>
                  models.IslamMessageBookModel.fromJson(bookListJson),
            )
            .toList();
      }
      Get.find<Logger>()
          .w("End `getBook` in |IslamMessageLocalDataSourceImpl|");
      return books;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getBook` in |IslamMessageLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
