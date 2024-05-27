import 'dart:convert';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class GuideToIslamLocalDataSource {
  Future<List<FixedEntities>> getContect();
  Future<List<MediaEntity>> getBooks();
  Future<List<MediaEntity>> getAudios();
  Future<List<MediaEntity>> getVideos();
}

class GuideToIslamLocalDataSourceImpl extends GuideToIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  GuideToIslamLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<FixedEntities>> getContect() async {
    try {
      Get.find<Logger>()
          .i("Start `getContect` in |GuideToIslamLocalDataSourceImpl|");
      String? guideToIslam =
          await archiveService.readFile(name: AppKeys.guideToIslam);

      List<FixedEntities> articals = [];
      if (guideToIslam != null) {
        var jsonData = json.decode(guideToIslam) as Map;
        var jsonguide = jsonData['guide-to-islam'][0] as Map;
        jsonguide['Articles'].forEach((key, value) {
          articals.add(FixedEntities(
            name: key,
            content: value,
          ));
        });
      }
      Get.find<Logger>()
          .w("End `getContect` in |GuideToIslamLocalDataSourceImpl|");
      return Future.value(articals);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getContect` in |GuideToIslamLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getBooks() async {
    try {
      Get.find<Logger>()
          .i("Start `getBooks` in |GuideToIslamLocalDataSourceImpl|");
      List<MediaEntity> result = [];

      String? json =
          await archiveService.readFile(name: AppKeys.guideToIslamBooks);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);
        print("## ${decoded['guide-to-islam'].runtimeType}");
        (((decoded['guide-to-islam']).elementAt(0))['books'] as Map)
            .forEach((name, url) {
          result.add(MediaEntity(name: name, url: url));
        });
      }
      return result;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getBooks` in |GuideToIslamLocalDataSourceImpl| Exception: ${e.runtimeType} $e",
      );
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getAudios() async {
    try {
      Get.find<Logger>()
          .i("Start `getAudios` in |GuideToIslamLocalDataSourceImpl|");
      List<MediaEntity> result = [];
      String? json =
          await archiveService.readFile(name: AppKeys.guideToIslamAudios);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);

        (((decoded['guide-to-islam'] as List)[0] as Map)['auidos'] as Map)
            .forEach((name, url) {
          result.add(MediaEntity(name: name, url: url));
        });
      }
      return result;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getAudios` in |GuideToIslamLocalDataSourceImpl| Exception: ${e.runtimeType} $e",
      );
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getVideos() async {
    try {
      Get.find<Logger>()
          .i("Start `getVideos` in |GuideToIslamLocalDataSourceImpl|");
      List<MediaEntity> result = [];
      String? json =
          await archiveService.readFile(name: AppKeys.guideToIslamVideos);
      if (json != null) {
        Map<String, dynamic> decoded = jsonDecode(json);
        (((decoded['guide-to-islam'] as List)[0] as Map)['videos'] as Map)
            .forEach((name, url) {
          result.add(MediaEntity(name: name, url: url));
        });
      }
      return result;
    } catch (e) {
      Get.find<Logger>().e(
        "End `getVideos` in |GuideToIslamLocalDataSourceImpl| Exception: ${e.runtimeType} $e",
      );
      rethrow;
    }
  }
}
