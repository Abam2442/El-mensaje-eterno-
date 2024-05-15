import 'dart:convert';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class GuideToIslamLocalDataSource {
  Future<List<List<FixedEntities>>> getContect();
  Future<List<MediaEntity>> getBooks();
  Future<List<MediaEntity>> getAudios();
}

class GuideToIslamLocalDataSourceImpl extends GuideToIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  GuideToIslamLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<List<FixedEntities>>> getContect() async {
    try {
      print('## false case');
      Get.find<Logger>()
          .i("Start `getContect` in |GuideToIslamLocalDataSourceImpl|");
      String? guideToIslam =
          await archiveService.readFile(name: AppKeys.guideToIslam);
      List<FixedEntities> videos = [];
      List<FixedEntities> audios = [];
      List<FixedEntities> books = [];
      List<FixedEntities> articals = [];
      if (guideToIslam != null) {
        var jsonData = json.decode(guideToIslam) as Map;
        var jsonguide = jsonData['guide-to-islam'][0] as Map;
        // print(jsonData['guide-to-islam'][0]['Articles']);
        jsonguide['videos'].forEach((key, value) {
          videos.add(FixedEntities(
            name: key,
            content: value,
          ));
        });

        jsonguide['auidos'].forEach((key, value) {
          audios.add(FixedEntities(
            name: key,
            content: value,
          ));
        });

        jsonguide['books'].forEach((key, value) {
          books.add(FixedEntities(
            name: key,
            content: value,
          ));
        });

        // jsonData['islam-house']['Fatwa'].forEach((key, value) {
        //   fatwas.add(FixedEntities(
        //     name: key,
        //     content: value,
        //   ));
        // });

        jsonguide['Articles'].forEach((key, value) {
          articals.add(FixedEntities(
            name: key,
            content: value,
          ));
        });
      }
      Get.find<Logger>()
          .w("End `getContect` in |GuideToIslamLocalDataSourceImpl|");
      return Future.value([videos, audios, books, articals]);
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
        print(((decoded['guide-to-islam'] as List)[0]).runtimeType);
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
}
