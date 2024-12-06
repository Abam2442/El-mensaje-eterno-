import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../models/saber_el_islam_model.dart';

abstract class SaberElIslamLocalDataSource {
  Future<List<SaberElIslamModel>> getArtical();
}

class SaberElIslamLocalDataSourceImp extends SaberElIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  SaberElIslamLocalDataSourceImp({
    required this.sharedPreferencesService,
  });
  @override
  Future<List<SaberElIslamModel>> getArtical() async {
    // Get.find<Logger>()
    //     .i("Start `getArtical` in |SaberElIslamLocalDataSourceImp|");
    // String? fileContent =
    // await archiveService.readFile(name: AppKeys.saberElIslam);
    final jsonData = await getOfflineData(AppKeys.saberElIslam);

    List<SaberElIslamModel> articals = [];
    // if (fileContent != null) {
    // Map jsonData = json.decode(fileContent);
    jsonData.forEach((key, value) {
      List<SEIArtical> subArticals = [];
      value['المقالات'].forEach((key, value) {
        subArticals.add(SEIArtical(
            link: value['الرابط'], artical: value['المقال'], title: key));
      });

      articals.add(SaberElIslamModel(
          articals: subArticals, link: value['الرابط'], name: key));
    });
    // }
    // Get.find<Logger>()
    //     .w("End `getArtical` in |SaberElIslamLocalDataSourceImp|");
    return Future.value(articals);
  }
}
