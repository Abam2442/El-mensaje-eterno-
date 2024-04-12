import 'dart:convert';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class GuideToIslamLocalDataSource {
  Future<List<List<FixedEntities>>> getContect();
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
      Get.find<Logger>()
          .i("Start `getContect` in |GuideToIslamLocalDataSourceImpl|");
      String? islamHouseJson =
          await archiveService.readFile(name: AppKeys.guideToIslam);
      List<FixedEntities> videos = [];
      List<FixedEntities> audios = [];
      List<FixedEntities> books = [];

      List<FixedEntities> articals = [];
      if (islamHouseJson != null) {
        var jsonData = json.decode(islamHouseJson) as Map;
        var jsonguide = jsonData['guide-to-islam'] as Map;
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
}
