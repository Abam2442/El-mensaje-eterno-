import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';

abstract class BeginingLocalDataSource {
  Future<List<FixedEntities>> getArtical();
}

class BeginingLocalDataSourceImp extends BeginingLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  BeginingLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<FixedEntities>> getArtical() async {
    
    String? fileContent =
        await archiveService.readFile(name: AppKeys.beginningAndEnd);
    List<FixedEntities> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      jsonData['beginning-and-end'].forEach((key, value) {
        articals.add(FixedEntities(
          name: key,
          content: value,
        ));
      });
    }
    
    return Future.value(articals);
  }
}
