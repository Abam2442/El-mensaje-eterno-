import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class NonMuslimLocalDataSource {
  Future<List<NonMuslimModel>> getCourses();
}

class NonMuslimLocalDataSourceImpl extends NonMuslimLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  NonMuslimLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<NonMuslimModel>> getCourses() async {
    try {
      Get.find<Logger>().i("Start `getCourses` in |NonMuslimLocalDataSourceImpl|");
      // String? fileContent = await firebaseStorageService.readFile(name: AppKeys.muslims);
      String? fileContent = await archiveService.readFile(name: AppKeys.nonMuslims);

      /// TODO get data from file depend on content and convert to models
      /// example:
      // / `
      List<NonMuslimModel> hadithes = [];
      if (fileContent != null) {
        var jsonData = json.decode(fileContent);
        hadithes = jsonData
            .map<NonMuslimModel>(
              (surah) => NonMuslimModel.fromJson(surah),
            )
            .toList();
      }
      // /  `
      Get.find<Logger>().w("End `getCourses` in |NonMuslimLocalDataSourceImpl|");
      return Future.value(hadithes /** hadithes **/);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getCourses` in |NonMuslimLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
