import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class WomenLocalDataSource {
  Future<List<FixedEntities>> getArtical();
}

class WomenLocalDataSourceImp extends WomenLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  WomenLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<FixedEntities>> getArtical() async {
    Get.find<Logger>().i("Start `getArtical` in |WomenLocalDataSourceImp|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.womanInIslam);
    List<FixedEntities> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      jsonData['woman-in-islam'].forEach((key, value) {
        articals.add(FixedEntities(name: key, content: value));
      });
    }
    Get.find<Logger>().w("End `getArtical` in |WomenLocalDataSourceImp|");
    return Future.value(articals);
  }
}
