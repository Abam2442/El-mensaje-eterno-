import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';

import '../../../domain/entities/fixed_entities.dart';

abstract class TerminologyLocalDataSource {
  Future<List<FixedEntities>> getArtical();
}

class TerminologyLocalDataSourceImp extends TerminologyLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  TerminologyLocalDataSourceImp({
    required this.sharedPreferencesService,
  });
  @override
  Future<List<FixedEntities>> getArtical() async {
    // Get.find<Logger>()
    //     .i("Start `getArtical` in |TerminologyLocalDataSourceImp|");
    // String? fileContent =
    //     await archiveService.readFile(name: AppKeys.terminology);
    List<FixedEntities> articals = [];
    final jsonData = await getOfflineData(AppKeys.terminology);

    // if (fileContent != null) {
    // Map jsonData = json.decode(fileContent);
    jsonData['terminology'].forEach((key, value) {
      articals.add(FixedEntities(name: key, content: value));
    });
    // }
    // Get.find<Logger>().w("End `getArtical` in |TerminologyLocalDataSourceImp|");
    return Future.value(articals);
  }
}
