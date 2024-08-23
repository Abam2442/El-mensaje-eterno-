import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class RomanceLocalDataSource {
  Future<List<FixedEntities>> getArtical();
}

class RomanceLocalDataSourceImp extends RomanceLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  RomanceLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<FixedEntities>> getArtical() async {
    
    String? fileContent =
        await archiveService.readFile(name: AppKeys.romanceInIslam);
    List<FixedEntities> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      jsonData['romance-in-islam'].forEach((key, value) {
        articals.add(FixedEntities(name: key, content: value));
      });
    }
    
    return Future.value(articals);
  }
}
