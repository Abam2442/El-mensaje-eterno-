import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';

abstract class HadithLocalDataSource {
  Future<SunnahHadithModel> getSunnahHadithes();
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
  Future<SunnahHadithModel> getSunnahHadithes() async {
    try {
      String? fileContent = await archiveService.readFile(name: AppKeys.hadith);

      late SunnahHadithModel sunnahHadithes;
      if (fileContent != null) {
        var jsonData = json.decode(fileContent);
        sunnahHadithes = SunnahHadithModel.fromJson(jsonData);
      }

      return sunnahHadithes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HaditencHadithModel> getHadithencHadithes() async {
    try {
      String? fileContent = await archiveService.readFile(name: AppKeys.hadith);

      late HaditencHadithModel hadithencHadithes;
      if (fileContent != null) {
        var jsonData = json.decode(fileContent);
        hadithencHadithes = HaditencHadithModel.fromJson(jsonData);
      }

      return Future.value(hadithencHadithes);
    } catch (e) {
      rethrow;
    }
  }
}
