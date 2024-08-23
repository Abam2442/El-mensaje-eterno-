import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class LoveInIslamLocalDataSource {
  Future<List<FixedEntities>> getArtical();
}

class LoveInIslamLocalDataSourceImp extends LoveInIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  LoveInIslamLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<FixedEntities>> getArtical() async {
    String? fileContent =
        await archiveService.readFile(name: AppKeys.loveInIslam);
    List<FixedEntities> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      jsonData['love-in-islam'].forEach((key, value) {
        articals.add(FixedEntities(name: key, content: value));
      });
    }

    return Future.value(articals);
  }
}
