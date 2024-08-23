import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';

import '../../domain/entities/fixed_entities.dart';

abstract class FirstStepLocalDataSource {
  Future<List<FixedEntities>> getArtical();
}

class FirstStepLocalDataSourceImp extends FirstStepLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  FirstStepLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<FixedEntities>> getArtical() async {
    
    String? fileContent =
        await archiveService.readFile(name: AppKeys.firstSteps);
    List<FixedEntities> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      jsonData['1st-steps'].forEach((key, value) {
        articals.add(FixedEntities(name: key, content: value));
      });
    }
    
    return Future.value(articals);
  }
}
