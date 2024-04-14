import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/fixed_entities.dart';
import '../models/saber_el_islam_model.dart';

abstract class SaberElIslamLocalDataSource {
  Future<List<SaberElIslamModel>> getArtical();
}

class SaberElIslamLocalDataSourceImp extends SaberElIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  SaberElIslamLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<SaberElIslamModel>> getArtical() async {
    Get.find<Logger>()
        .i("Start `getArtical` in |SaberElIslamLocalDataSourceImp|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.saberElIslam);
    List<SaberElIslamModel> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      jsonData.forEach((key, value) {
        List<SEIArtical> subArticals = [];
        value['المقالات'].forEach((key, value) {
          subArticals.add(SEIArtical(
              link: value['الرابط'], artical: value['المقال'], title: key));
        });

        articals.add(SaberElIslamModel(
            articals: subArticals, link: value['الرابط'], name: key));
      });
    }
    Get.find<Logger>()
        .w("End `getArtical` in |SaberElIslamLocalDataSourceImp|");
    return Future.value(articals);
  }
}
