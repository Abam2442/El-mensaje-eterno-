import 'dart:convert';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/books_list_model.dart'
    as models;
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../models/islam_message_model.dart';

abstract class IslamMessageLocalDataSource {
  Future<List<IslamMessageArticalModel>> getArtical();
  Future<List<MediaCategoryEntity>> getBook();
  Future<List<MediaEntity>> getAudio();
  Future<List<MediaEntity>> getVideos();
  Future<List<MediaEntity>> getQuranVideos();
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

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getAudio() async {
    try {
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

      return Future.value(audios);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getQuranVideos() async {
    try {
      String? islamMessageJson =
          await archiveService.readFile(name: AppKeys.islamMessageQuranVideos);
      List<MediaEntity> videos = [];
      if (islamMessageJson != null) {
        var jsonData = json.decode(islamMessageJson);
        videos = (jsonData)
            .map<MediaEntity>(
              (map) => MediaEntity(name: map.keys.first, url: map.values.first),
            )
            .toList();
      }

      return Future.value(videos);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getBook() async {
    try {
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

      return books;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getVideos() async {
    try {
      String? islamMessageJson =
          await archiveService.readFile(name: AppKeys.islamMessageVideos);
      List<MediaEntity> videos = [];
      if (islamMessageJson != null) {
        var jsonData = json.decode(islamMessageJson);
        videos = (jsonData)
            .map<MediaEntity>(
              (map) => MediaEntity(name: map.keys.first, url: map.values.first),
            )
            .toList();
      }

      return Future.value(videos);
    } catch (e) {
      rethrow;
    }
  }
}
