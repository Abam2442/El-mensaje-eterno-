import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/saber_el_islam_model.dart';

abstract class SaberElIslamLocalDataSource {
  Future<List<SaberElIslamModel>> getArtical();
}

class SaberElIslamLocalDataSourceImp extends SaberElIslamLocalDataSource {
  @override
  Future<List<SaberElIslamModel>> getArtical() async {
    final jsonData = await getOfflineData(AppKeys.saberElIslam);

    List<SaberElIslamModel> articals = [];
    jsonData.forEach((key, value) {
      List<SEIArtical> subArticals = [];
      value['المقالات'].forEach((key, value) {
        subArticals.add(SEIArtical(
            link: value['الرابط'], artical: value['المقال'], title: key));
      });

      articals.add(SaberElIslamModel(
          articals: subArticals, link: value['الرابط'], name: key));
    });
    return Future.value(articals);
  }
}
