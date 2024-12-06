import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:http/http.dart' as http;
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/islam_land_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

abstract class IslamLandRemoteDataSource {
  Future<List<List<FixedEntities>>> getOnlineContent();
  Future<List<IslamLandFatwaEntities>> getNetOfflineFatwa();
  Future<Map<String, List<MediaEntity>>> getOnlineBooks();
  Future<List<MediaEntity>> getOnlineAudio();
  Future<List<MediaEntity>> getOnlineVideos();
  Future<List<MediaEntity>> getNetFatwa();
}

class IslamLandRemoteDataSourceImpl extends IslamLandRemoteDataSource {
  @override
  Future<List<MediaEntity>> getNetFatwa() async {
    try {
      List<MediaEntity> result = [];
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamLandFatwa}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      (finalData['islam-Land']['Fatwas Online'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<IslamLandFatwaEntities>> getNetOfflineFatwa() async {
    try {
      List<IslamLandFatwaEntities> result = [];
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamLandFatwa}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      finalData['islam-Land']['Fatawas'].forEach((key, value) {
        result.add(IslamLandFatwaEntities(
            title: key, question: value['question'], answer: value['answer']));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getOnlineAudio() async {
    try {
      List<MediaEntity> result = [];
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamLandAudios}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      (finalData['islam-Land']['Audios'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, List<MediaEntity>>> getOnlineBooks() async {
    try {
      Map<String, List<MediaEntity>> result = {};
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamLandAudios}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      finalData.forEach((bookCategory, value) {
        result[bookCategory] = [];
        for (Map booksMap in value) {
          booksMap.forEach((bookName, content) {
            MediaEntity bookEnitie = MediaEntity(name: bookName, url: content);
            result[bookCategory]!.add(bookEnitie);
          });
        }
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<List<FixedEntities>>> getOnlineContent() async {
    try {
      List<FixedEntities> articals = [];
      List<FixedEntities> articalsOn = [];
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamLand}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      finalData['islam-Land']['Articles'].forEach((key, value) {
        articals.add(FixedEntities(name: key, content: value));
      });
      finalData['islam-Land']['Articles Online'].forEach((key, value) {
        articalsOn.add(FixedEntities(name: key, content: value));
      });
      return [articals, articalsOn];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getOnlineVideos() async {
    try {
      List<MediaEntity> result = [];
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamLandVideos}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      (finalData['islam-Land']['Videos'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
