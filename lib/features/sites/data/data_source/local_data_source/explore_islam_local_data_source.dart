import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../models/explore_islam_model.dart';

abstract class ExploreIslamLocalDataSource {
  Future<List<ExploreIslamModel>> getArtical();
}

class ExploreIslamLocalDataSourceImp extends ExploreIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  ExploreIslamLocalDataSourceImp({
    required this.sharedPreferencesService,
  });
  @override
  Future<List<ExploreIslamModel>> getArtical() async {
    try {
      List<ExploreIslamModel> articals = [];
      final jsonData = await getOfflineData(AppKeys.exploreIslam);
      articals = jsonData['explore-islam']
          .map<ExploreIslamModel>(
            (artical) => ExploreIslamModel.fromJson(artical),
          )
          .toList();

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }
}
