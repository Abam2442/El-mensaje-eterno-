import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class HisnulMuminLocalDataSource {
  Future<List<FixedEntities>> getArtical();
}

class HisnulMuminLocalDataSourceImp extends HisnulMuminLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  HisnulMuminLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<FixedEntities>> getArtical() async {
    Get.find<Logger>()
        .i("Start `getArtical` in |HisnulMuminLocalDataSourceImp|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.hisnulmumin);
    List<FixedEntities> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      jsonData['Spanish'].forEach((key, value) {
        articals.add(FixedEntities(
          name: key,
          content: value,
        ));
      });
    }
    Get.find<Logger>().w("End `getArtical` in |HisnulMuminLocalDataSourceImp|");
    return Future.value(articals);
  }
}
