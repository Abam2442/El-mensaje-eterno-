import 'dart:convert';
import 'dart:developer';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class HadithLocalDataSource {
  Future<List<SunnahHadithModel>> getSunnahHadithes();
  Future<HaditencHadithModel> getHadithencHadithes();
}

class HadithLocalDataSourceImpl extends HadithLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  HadithLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<SunnahHadithModel>> getSunnahHadithes() async {
    try {
      Get.find<Logger>()
          .i("Start `getHadithes` in |HadithLocalDataSourceImpl|");
      String? fileContent = await archiveService.readFile(name: AppKeys.hadith);

      List<SunnahHadithModel> sunnahHadithes = [];
      if (fileContent != null) {
        var jsonData = json.decode(fileContent) as Map<String, dynamic>;
        sunnahHadithes = jsonData.entries
            .map((entry) => SunnahHadithModel.fromJson(entry.value, entry.key))
            .toList();
      }
      Get.find<Logger>().w("End `getHadithes` in |HadithLocalDataSourceImpl|");
      return sunnahHadithes;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<HaditencHadithModel> getHadithencHadithes() async {
    try {
      Get.find<Logger>()
          .i("Start `getHadithes` in |HadithLocalDataSourceImpl|");
      String? fileContent = await archiveService.readFile(name: AppKeys.hadith);

      late HaditencHadithModel hadithencHadithes;
      if (fileContent != null) {
        var jsonData = json.decode(fileContent);
        hadithencHadithes = HaditencHadithModel.fromJson(jsonData);
      }

      Get.find<Logger>().w("End `getHadithes` in |HadithLocalDataSourceImpl|");
      return Future.value(hadithencHadithes);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getHadithes` in |HadithLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
