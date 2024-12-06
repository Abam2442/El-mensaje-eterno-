import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../../domain/entities/fixed_entities.dart';

abstract class GuideToIslamLocalDataSource {
  Future<List<FixedEntities>> getContect();
  Future<List<MediaEntity>> getBooks();
  Future<List<MediaEntity>> getAudios();
  Future<List<MediaEntity>> getVideos();
}

class GuideToIslamLocalDataSourceImpl extends GuideToIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  GuideToIslamLocalDataSourceImpl({
    required this.sharedPreferencesService,
  });

  @override
  Future<List<FixedEntities>> getContect() async {
    try {
      // String? guideToIslam =
      // await archiveService.readFile(name: AppKeys.guideToIslam);
      final jsonData = await getOfflineData(AppKeys.guideToIslam);

      List<FixedEntities> articals = [];
      // if (guideToIslam != null) {
      // var jsonData = json.decode(guideToIslam) as Map;
      var jsonguide = jsonData['guide-to-islam'][0] as Map;
      jsonguide['Articles'].forEach((key, value) {
        articals.add(FixedEntities(
          name: key,
          content: value,
        ));
      });
      // }

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getBooks() async {
    try {
      List<MediaEntity> result = [];

      // String? json =/
      final jsonData = await getOfflineData(AppKeys.guideToIslamBooks);

      // if (json != null) {
      // Map<String, dynamic> decoded = jsonDecode(json);
      // print("## ${decoded['guide-to-islam'].runtimeType}");
      (((jsonData['guide-to-islam']).elementAt(0))['books'] as Map)
          .forEach((name, url) {
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
      // String? json =
      // await archiveService.readFile(name: AppKeys.guideToIslamAudios);
      final jsonData = await getOfflineData(AppKeys.guideToIslamAudios);

      // if (json != null) {
      // Map<String, dynamic> decoded = jsonDecode(json);

      (((jsonData['guide-to-islam'] as List)[0] as Map)['auidos'] as Map)
          .forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      // }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getVideos() async {
    try {
      List<MediaEntity> result = [];
      final jsonData = await getOfflineData(AppKeys.guideToIslamVideos);

      // String? json =
      // await archiveService.readFile(name: AppKeys.guideToIslamVideos);
      // if (json != null) {
      // Map<String, dynamic> decoded = jsonDecode(json);
      (((jsonData['guide-to-islam'] as List)[0] as Map)['videos'] as Map)
          .forEach((name, url) {
        result.add(MediaEntity(name: name, url: url));
      });
      // }
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
