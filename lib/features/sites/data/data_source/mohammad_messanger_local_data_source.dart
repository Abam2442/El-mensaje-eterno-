import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class MohammadMessangerLocalDataSource {
  Future<List<FixedEntities>> getArtical();
}

class MohammadMessangerLocalDataSourceImp
    extends MohammadMessangerLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  MohammadMessangerLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<FixedEntities>> getArtical() async {
    Get.find<Logger>()
        .i("Start `getArtical` in |MohammadMessangerLocalDataSourceImp|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.muhammadTheMessengerOfGod);
    List<FixedEntities> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      jsonData['Muhammad-the-messenger-of-God'].forEach((key, value) {
        articals.add(FixedEntities(name: key, content: value));
      });
    }
    Get.find<Logger>()
        .w("End `getArtical` in |MohammadMessangerLocalDataSourceImp|");
    return Future.value(articals);
  }
}
