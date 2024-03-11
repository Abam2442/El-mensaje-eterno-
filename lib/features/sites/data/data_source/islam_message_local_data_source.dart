import 'dart:convert';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../models/islam_message_model.dart';

abstract class IslamMessageLocalDataSource {
  Future<List<IslamMessageArticalModel>> getArtical();
  Future<List<IslamMessageBookModel>> getBook();
  Future<List<IslamMessageAudioModel>> getAudio();
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
  Future<List<IslamMessageAudioModel>> getAudio() async {
    try {
      Get.find<Logger>()
          .i("Start `getAudio` in |IslamMessageLocalDataSourceImpl|");
      String? islamMessageJson =
          await archiveService.readFile(name: AppKeys.islamMessage);
      List<IslamMessageAudioModel> audios = [];
      if (islamMessageJson != null) {
        var jsonData = json.decode(islamMessageJson);
        audios = jsonData['islam-message']['audios']
            .map<IslamMessageAudioModel>(
              (audio) => IslamMessageAudioModel.fromJson(audio),
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
  Future<List<IslamMessageBookModel>> getBook() async {
    try {
      Get.find<Logger>()
          .i("Start `getBook` in |IslamMessageLocalDataSourceImpl|");
      String? islamMessageJson =
          await archiveService.readFile(name: AppKeys.islamMessage);
      List<IslamMessageBookModel> books = [];
      if (islamMessageJson != null) {
        var jsonData = json.decode(islamMessageJson);
        books = jsonData['islam-message']['booksCategories']
            .map<IslamMessageBookModel>(
              (book) => IslamMessageBookModel.fromJson(book),
            )
            .toList();
      }
      Get.find<Logger>()
          .w("End `getBook` in |IslamMessageLocalDataSourceImpl|");
      return Future.value(books);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getBook` in |IslamMessageLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
