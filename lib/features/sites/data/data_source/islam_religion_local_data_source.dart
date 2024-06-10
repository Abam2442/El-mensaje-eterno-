import 'dart:convert';

import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/entities/islam_for_christians_entities.dart';
import '../../domain/entities/islam_religion_entities.dart';

abstract class IslamReligionLocalDataSource {
  Future<List<IslamReligionEntities>> getContent();
}

class IslamReligionLocalDataSourceImp extends IslamReligionLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  IslamReligionLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<IslamReligionEntities>> getContent() async {
    String? fileContent =
        await archiveService.readFile(name: AppKeys.islamReligion);
    List<IslamReligionEntities> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);

      jsonData['islam-Religion'].forEach((key, value) {
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

    return Future.value(articals);
  }
}
