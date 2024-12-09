import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_online_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/knowing_allah_model.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

abstract class KnowingAllahRemoteDataSource {
  Future<List<KnowingAllahSubCategoryModel>> getOnlineContent();
  Future<List<MediaEntity>> getOnlineBooks();
  Future<List<MediaEntity>> getOnlineAudios();
  Future<List<MediaCategoryEntity>> getOnlineVideos();
}

class KnowingAllahRemoteDataSourceImpl extends KnowingAllahRemoteDataSource {
  @override
  Future<List<MediaEntity>> getOnlineAudios() async {
    try {
      final response = await getOnlineData(AppKeys.knowingAllahAudios);
      List<MediaEntity> result = [];
      (response['knowing-Allah']['Audios'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getOnlineBooks() async {
    try {
      List<MediaEntity> result = [];

      final response = await getOnlineData(AppKeys.knowingAllahBooks);
      (response['knowing-Allah']['Books'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<KnowingAllahSubCategoryModel>> getOnlineContent() async {
    try {
      List<KnowingAllahSubCategoryModel> articles = [];

      final jsonData = await getOnlineData(AppKeys.knowingAllah);
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
      return articles;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getOnlineVideos() async {
    try {
      List<MediaCategoryEntity> result = [];

      final jsonData = await getOnlineData(AppKeys.knowingAllahVideos);
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
