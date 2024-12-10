import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../models/islam_web_model.dart';

abstract class IslamWebLocalDataSource {
  Future<List<IslamWebModel>> getArtical();
}

class IslamWebLocalDataSourceImpl extends IslamWebLocalDataSource {
  @override
  Future<List<IslamWebModel>> getArtical() async {
    try {
      final jsonData = await getOfflineData(AppKeys.islamWeb);

      List<IslamWebModel> articals = [];
      articals = jsonData['islamweb']
          .map<IslamWebModel>(
            (artical) => IslamWebModel.fromJson(artical),
          )
          .toList();

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }
}
