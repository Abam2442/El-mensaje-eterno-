import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_online_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

abstract class RasuluallhRemoteDataSource {
  Future<List<CategoryFixedEntity>> getOnlineContent();
  Future<List<MediaEntity>> getOnlineAudios();
  Future<List<MediaCategoryEntity>> getOnlineVideos();
}

class RasuluallhRemoteDataSourceImpl extends RasuluallhRemoteDataSource {
  @override
  Future<List<MediaEntity>> getOnlineAudios() async {
    try {
      List<MediaEntity> audios = [];

      final jsonData = await getOnlineData(AppKeys.rasuluAllahAudios);
      ((jsonData['RasuluAllah']['Audios']) as Map).forEach(
        (key, value) {
          audios.add(MediaEntity(url: key, name: value));
        },
      );
      return audios;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CategoryFixedEntity>> getOnlineContent() async {
    try {
      List<CategoryFixedEntity> articals = [];

      final jsonData = await getOnlineData(AppKeys.rasuluAllah);
      (jsonData['RasuluAllah']['articles']).forEach((category, categoryData) {
        CategoryFixedEntity item =
            CategoryFixedEntity(category: category, data: []);
        categoryData.forEach((articalName, articalBody) {
          item.data.add(FixedEntities(name: articalName, content: articalBody));
        });
        articals.add(item);
      });
      return articals;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getOnlineVideos() async {
    try {
      List<MediaCategoryEntity> result = [];

      final jsonData = await getOnlineData(AppKeys.rasuluAllahVideos);
      (jsonData['RasuluAllah']['Videos'] as Map).forEach((category, dataMap) {
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
