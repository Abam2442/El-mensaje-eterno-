import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../../domain/entities/fixed_entities.dart';

abstract class RasuluallhLocalDataSource {
  Future<List<CategoryFixedEntity>> getContent();
  Future<List<MediaEntity>> getAudios();
  Future<List<MediaCategoryEntity>> getVideos();
}

class RasuluallhLocalDataSourceImp extends RasuluallhLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  RasuluallhLocalDataSourceImp({
    required this.sharedPreferencesService,
  });
  @override
  Future<List<CategoryFixedEntity>> getContent() async {
    // Get.find<Logger>()
    //     .i("Start `getContent` in |RasuluallhLocalDataSourceImp|");
    // String? fileContent =
    //     await archiveService.readFile(name: AppKeys.rasuluAllah);
    List<CategoryFixedEntity> articals = [];
    // if (fileContent != null) {
    // Map jsonData = json.decode(fileContent);
    final jsonData = await getOfflineData(AppKeys.rasuluAllah);

    (jsonData['RasuluAllah']['articles']).forEach((category, categoryData) {
      CategoryFixedEntity item =
          CategoryFixedEntity(category: category, data: []);
      categoryData.forEach((articalName, articalBody) {
        item.data.add(FixedEntities(name: articalName, content: articalBody));
      });
      articals.add(item);
    });
    // }
    // Get.find<Logger>().w("End `getContent` in |RasuluallhLocalDataSourceImp|");
    return Future.value(articals);
  }

  @override
  Future<List<MediaEntity>> getAudios() async {
    try {
      // Get.find<Logger>()
      //     .i("Start `getAudio` in |RasuluallhLocalDataSourceImp|");
      // String? jsonString =
      //     await archiveService.readFile(name: AppKeys.rasuluAllahAudios);
      List<MediaEntity> audios = [];
      // if (jsonString != null) {
      // var jsonData = json.decode(jsonString);
      final jsonData = await getOfflineData(AppKeys.rasuluAllahAudios);

      ((jsonData['RasuluAllah']['Audios']) as Map).forEach(
        (key, value) {
          audios.add(MediaEntity(url: key, name: value));
        },
      );
      // }
      // Get.find<Logger>().w("End `getAudio` in |RasuluallhLocalDataSourceImp|");
      return Future.value(audios);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaCategoryEntity>> getVideos() async {
    try {
      // Get.find<Logger>()
      //     .i("Start `getVideos` in |RasuluallhLocalDataSourceImp|");
      List<MediaCategoryEntity> result = [];
      // String? json =
      // await archiveService.readFile(name: AppKeys.rasuluAllahVideos);
      // if (json != null) {
      // Map<String, dynamic> decoded = jsonDecode(json);
      final jsonData = await getOfflineData(AppKeys.rasuluAllahVideos);

      (jsonData['RasuluAllah']['Videos'] as Map).forEach((category, dataMap) {
        List<MediaEntity> data = [];
        (dataMap as Map).forEach((name, url) {
          data.add(MediaEntity(name: name, url: url));
        });
        result.add(MediaCategoryEntity(category: category, data: data));
      });
      // }
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
