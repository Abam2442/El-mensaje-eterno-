import 'dart:convert';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';

import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/entities/islam_for_christians_entities.dart';
import '../../domain/entities/islam_religion_entities.dart';

abstract class RasuluallhLocalDataSource {
  Future<List<IslamReligionEntities>> getContent();
  Future<List<MediaEntity>> getAudios();
}

class RasuluallhLocalDataSourceImp extends RasuluallhLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  RasuluallhLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<IslamReligionEntities>> getContent() async {
    Get.find<Logger>()
        .i("Start `getContent` in |RasuluallhLocalDataSourceImp|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.rasuluAllah);
    List<IslamReligionEntities> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);

      jsonData['RasuluAllah'].forEach((key, value) {
        List<IslamForChristiansEntities> catigory = [];

        value.forEach((key, value) {
          List<FixedEntities> subCatigory = [];
          value.forEach((key, value) {
            subCatigory.add(FixedEntities(name: key, content: value));
          });
          catigory.add(IslamForChristiansEntities(
            name: key,
            subCatigory: subCatigory,
          ));
        });
        articals.add(IslamReligionEntities(
          name: key,
          catigory: catigory,
        ));
      });
    }
    Get.find<Logger>().w("End `getContent` in |RasuluallhLocalDataSourceImp|");
    return Future.value(articals);
  }

  @override
  Future<List<MediaEntity>> getAudios() async {
    try {
      Get.find<Logger>()
          .i("Start `getAudio` in |RasuluallhLocalDataSourceImp|");
      String? jsonString =
          await archiveService.readFile(name: AppKeys.rasuluAllahAudios);
      List<MediaEntity> audios = [];
      if (jsonString != null) {
        var jsonData = json.decode(jsonString);
        audios = jsonData['RasuluAllah']['Audios']
            .map<MediaEntity>(
              (key, value) => MediaEntity(url: key, name: value),
            )
            .toList();
      }
      Get.find<Logger>().w("End `getAudio` in |RasuluallhLocalDataSourceImp|");
      return Future.value(audios);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getAudio` in |RasuluallhLocalDataSourceImp| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
