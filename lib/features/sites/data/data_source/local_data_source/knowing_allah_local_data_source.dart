import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../models/knowing_allah_model.dart';

abstract class KnowingAllahLocalDataSource {
  Future<List<KnowingAllahSubCategoryModel>> getContent();
  Future<List<MediaEntity>> getBooks();
  Future<List<MediaEntity>> getAudios();
  Future<List<MediaCategoryEntity>> getVideos();
}

class KnowingAllahLocalDataSourceImp extends KnowingAllahLocalDataSource {
  @override
  Future<List<KnowingAllahSubCategoryModel>> getContent() async {
    List<KnowingAllahSubCategoryModel> articles = [];
    final jsonData = await getAssetsData(AppKeys.knowingAllah);

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

    return Future.value(articles);
  }

  @override
  Future<List<MediaEntity>> getBooks() async {
    try {
      List<MediaEntity> result = [];
      final jsonData = await getAssetsData(AppKeys.knowingAllahBooks);

      (jsonData['knowing-Allah']['Books'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getAudios() async {
    try {
      List<MediaEntity> result = [];
      final jsonData = await getAssetsData(AppKeys.knowingAllahAudios);

      (jsonData['knowing-Allah']['Audios'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getVideos() async {
    try {
      List<MediaCategoryEntity> result = [];
      final jsonData = await getAssetsData(AppKeys.knowingAllahVideos);

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
