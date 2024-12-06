import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../../domain/entities/islam_for_christians_entities.dart';

abstract class IslamForChristiansLocalDataSource {
  Future<List<IslamForChristiansEntities>> getContent();
}

class IslamForChristiansLocalDataSourceImp
    extends IslamForChristiansLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  IslamForChristiansLocalDataSourceImp({
    required this.sharedPreferencesService,
  });
  @override
  Future<List<IslamForChristiansEntities>> getContent() async {
    // String? fileContent =
    // await archiveService.readFile(name: AppKeys.islamForChristians);
    final jsonData = await getOfflineData(AppKeys.islamForChristians);

    List<IslamForChristiansEntities> articals = [];
    // if (fileContent != null) {
    // Map jsonData = json.decode(fileContent);

    jsonData['islam-for-christians'].forEach((key, value) {
      List<FixedEntities> subCatigory = [];

      jsonData['islam-for-christians'][key].forEach((key, value) {
        subCatigory.add(FixedEntities(name: key, content: value));
      });
      articals.add(IslamForChristiansEntities(
        name: key,
        subCatigory: subCatigory,
      ));
    });
    // }

    return Future.value(articals);
  }
}
