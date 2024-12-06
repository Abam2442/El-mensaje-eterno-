import 'dart:convert';
import 'dart:developer';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/books_list_model.dart'
    as models;
import 'package:hiwayda_oracion_islamica/features/sites/data/models/islam_message_model.dart';
import 'package:http/http.dart' as http;
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

abstract class IslamMessageRemoteDataSource {
  Future<List<IslamMessageArticalModel>> getOnlineArticle();
  Future<List<MediaCategoryEntity>> getOnlineBooks();
  Future<List<MediaEntity>> getOnlineAudios();
  Future<List<MediaEntity>> getOnlineVideos();
  Future<List<MediaEntity>> getOnlineQuranVideos();
}

class IslamMessageRemoteDataSourceImpl extends IslamMessageRemoteDataSource {
  @override
  Future<List<IslamMessageArticalModel>> getOnlineArticle() async {
    try {
      log('OnlineData');
      List<IslamMessageArticalModel> articals = [];
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamMessage}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      articals = finalData['islam-message']['articlesCategories']
          .map<IslamMessageArticalModel>(
            (artical) => IslamMessageArticalModel.fromJson(artical),
          )
          .toList();
      return articals;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getOnlineAudios() async {
    try {
      List<MediaEntity> audio = [];
      final response = await http.get(
          Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamMessageAudios}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      audio = finalData['islam-message']['audios']
          .map<MediaEntity>(
            (json) => MediaEntity(url: json['link'], name: json['title']),
          )
          .toList();
      return audio;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getOnlineBooks() async {
    try {
      List<MediaCategoryEntity> books = [];
      final response = await http.get(
          Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamMessageBooks}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      books = finalData['islam-message']['booksCategories']
          .map<models.IslamMessageBookModel>(
            (bookListJson) =>
                models.IslamMessageBookModel.fromJson(bookListJson),
          )
          .toList();
      return books;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getOnlineQuranVideos() async {
    try {
      List<MediaEntity> videos = [];
      final response = await http.get(Uri.parse(
          '${AppApiRoutes.jsonApi}${AppKeys.islamMessageQuranVideos}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      videos = (finalData)
          .map<MediaEntity>(
            (map) => MediaEntity(name: map.keys.first, url: map.values.first),
          )
          .toList();
      return videos;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getOnlineVideos() async {
    try {
      List<MediaEntity> videos = [];
      final response = await http.get(
          Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamMessageVideos}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      videos = (finalData)
          .map<MediaEntity>(
            (map) => MediaEntity(name: map.keys.first, url: map.values.first),
          )
          .toList();
      return videos;
    } catch (e) {
      rethrow;
    }
  }
}
