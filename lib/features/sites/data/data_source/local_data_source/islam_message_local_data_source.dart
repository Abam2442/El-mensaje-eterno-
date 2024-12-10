import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/books_list_model.dart'
    as models;
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../../core/constants/app_keys.dart';
import '../../models/islam_message_model.dart';

abstract class IslamMessageLocalDataSource {
  Future<List<IslamMessageArticalModel>> getArtical();
  Future<List<MediaCategoryEntity>> getBook();
  Future<List<MediaEntity>> getAudio();
  Future<List<MediaEntity>> getVideos();
  Future<List<MediaEntity>> getQuranVideos();
}

class IslamMessageLocalDataSourceImpl extends IslamMessageLocalDataSource {
  @override
  Future<List<IslamMessageArticalModel>> getArtical() async {
    try {
      List<IslamMessageArticalModel> articals = [];
      final jsonData = await getOfflineData(AppKeys.islamMessage);

      articals = jsonData['islam-message']['articlesCategories']
          .map<IslamMessageArticalModel>(
            (artical) => IslamMessageArticalModel.fromJson(artical),
          )
          .toList();

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getAudio() async {
    try {
      List<MediaEntity> audios = [];

      final jsonData = await getOfflineData(AppKeys.islamMessageAudios);

      audios = jsonData['islam-message']['audios']
          .map<MediaEntity>(
            (json) => MediaEntity(url: json['link'], name: json['title']),
          )
          .toList();

      return Future.value(audios);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getQuranVideos() async {
    try {
      List<MediaEntity> videos = [];

      final jsonData = await getOfflineData(AppKeys.islamMessageQuranVideos);

      videos = (jsonData)
          .map<MediaEntity>(
            (map) => MediaEntity(name: map.keys.first, url: map.values.first),
          )
          .toList();

      return Future.value(videos);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getBook() async {
    try {
      List<models.IslamMessageBookModel> books = [];

      final jsonData = await getOfflineData(AppKeys.islamMessageBooks);

      books = jsonData['islam-message']['booksCategories']
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
  Future<List<MediaEntity>> getVideos() async {
    try {
      List<MediaEntity> videos = [];

      final jsonData = await getOfflineData(AppKeys.islamMessageVideos);

      videos = (jsonData)
          .map<MediaEntity>(
            (map) => MediaEntity(name: map.keys.first, url: map.values.first),
          )
          .toList();

      return Future.value(videos);
    } catch (e) {
      rethrow;
    }
  }
}
