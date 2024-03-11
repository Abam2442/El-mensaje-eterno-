import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../models/azkar_model/azkar_model.dart';
import '../models/doaa_model/doaa_model.dart';

abstract class AzkarDoaaLocalDataSource {
  Future<List<AzkarModel>> getAzkar();

  Future<DoaaModel> getDoaas();
}

class AzkarDoaaLocalDataSourceImpl extends AzkarDoaaLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  AzkarDoaaLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<AzkarModel>> getAzkar() async {
    try {
      Get.find<Logger>().i("Start `getAzkars` in |AzkarLocalDataSourceImpl|");
      String? fileContent = await archiveService.readFile(name: AppKeys.azkarDua);

      List<AzkarModel> azkar = [];
      if (fileContent != null) {
        var jsonData = json.decode(fileContent);
        azkar = jsonData['azkar']
            .map<AzkarModel>(
              (azkar) => AzkarModel.fromJson(azkar),
            )
            .toList();
      }
      Get.find<Logger>().w("End `getAzkars` in |AzkarLocalDataSourceImpl|");
      return Future.value(azkar);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getAzkars` in |AzkarLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }

  @override
  Future<DoaaModel> getDoaas() async {
    try {
      Get.find<Logger>().i("Start `getDoaas` in |DoaaLocalDataSourceImpl|");
      String? fileContent = await archiveService.readFile(name: AppKeys.doaa);

      late DoaaModel doaas;
      if (fileContent != null) {
        var jsonData = json.decode(fileContent);
        doaas = DoaaModel.fromJson(jsonData);
      }
      Get.find<Logger>().w("End `getDoaas` in |DoaaLocalDataSourceImpl|");
      return Future.value(doaas);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getDoaas` in |DoaaLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
