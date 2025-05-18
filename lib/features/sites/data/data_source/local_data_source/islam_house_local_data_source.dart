import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

abstract class IslamHouseLocalDataSource {
  Future<List<FixedEntities>> getContect();
  Future<List<MediaEntity>> getBooks();
  Future<List<MediaEntity>> getAudios();
  Future<List<MediaEntity>> getVideos();
  Future<List<FixedEntities>> getFatwa();
}

class IslamHouseLocalDataSourceImpl extends IslamHouseLocalDataSource {


  @override
  Future<List<FixedEntities>> getContect() async {
    try {
      List<FixedEntities> articals = [];
      final jsonData = await getOfflineData(AppKeys.islamHouse);

      jsonData['islam-house']['Articles'].forEach((key, value) {
        articals.add(FixedEntities(
          name: key,
          content: value,
        ));
      });

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getBooks() async {
    try {
      List<MediaEntity> result = [];
      final jsonData = await getOfflineData(AppKeys.islamHouseBooks);

      (jsonData['islam-house']['Books'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getVideos() async {
    try {
      List<MediaEntity> result = [];
      final jsonData = await getOfflineData(AppKeys.islamHouseVideos);

      
      (jsonData['islam-house']['Videos'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      // }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getAudios() async {
    try {
      List<MediaEntity> result = [];
      final jsonData = await getOfflineData(AppKeys.islamHouseAudios);


      (jsonData['islam-house']['Audios'] as Map).forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FixedEntities>> getFatwa() async {
    try {
      List<FixedEntities> result = [];
      final jsonData = await getOfflineData(AppKeys.islamHouseFatwa);
      (jsonData['islam-house']['Fatwa'] as Map).forEach((name, content) {
        result.add(FixedEntities(name: name, content: content));
      });
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
