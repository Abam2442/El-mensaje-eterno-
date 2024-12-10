import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_online_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/islam_web_model.dart';

abstract class IslamWebRemoteDataSource {
  Future<List<IslamWebModel>> getOnlineArtical();
}

class IslamWebRemoteDataSourceImpl extends IslamWebRemoteDataSource {
  @override
  Future<List<IslamWebModel>> getOnlineArtical() async {
    try {
      final response = await getOnlineData(AppKeys.islamWeb);
      List<IslamWebModel> articals = [];
      articals = response['islamweb']
          .map<IslamWebModel>(
            (artical) => IslamWebModel.fromJson(artical),
          )
          .toList();
      return articals;
    } catch (e) {
      rethrow;
    }
  }
}
