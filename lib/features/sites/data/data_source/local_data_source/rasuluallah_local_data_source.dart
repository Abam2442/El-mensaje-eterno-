import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../domain/entities/fixed_entities.dart';

abstract class RasuluallhLocalDataSource {
  Future<List<CategoryFixedEntity>> getContent();
  Future<List<MediaEntity>> getAudios();
  Future<List<MediaCategoryEntity>> getVideos();
}

class RasuluallhLocalDataSourceImp extends RasuluallhLocalDataSource {
  @override
  Future<List<CategoryFixedEntity>> getContent() async {
    List<CategoryFixedEntity> articals = [];
    final jsonData = await getOfflineData(AppKeys.rasuluAllah);

    (jsonData['RasuluAllah']['articles']).forEach((category, categoryData) {
      CategoryFixedEntity item =
          CategoryFixedEntity(category: category, data: []);
      categoryData.forEach((articalName, articalBody) {
        item.data.add(FixedEntities(name: articalName, content: articalBody));
      });
      articals.add(item);
    });
    return Future.value(articals);
  }

  @override
  Future<List<MediaEntity>> getAudios() async {
    try {
      List<MediaEntity> audios = [];

      final jsonData = await getOfflineData(AppKeys.rasuluAllahAudios);

      ((jsonData['RasuluAllah']['Audios']) as Map).forEach(
        (key, value) {
          audios.add(MediaEntity(url: key, name: value));
        },
      );
      return Future.value(audios);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getVideos() async {
    try {
      List<MediaCategoryEntity> result = [];
      final jsonData = await getOfflineData(AppKeys.rasuluAllahVideos);

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
