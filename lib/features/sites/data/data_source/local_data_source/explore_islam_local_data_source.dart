import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/explore_islam_model.dart';

abstract class ExploreIslamLocalDataSource {
  Future<List<ExploreIslamModel>> getArtical();
}

class ExploreIslamLocalDataSourceImp extends ExploreIslamLocalDataSource {
  @override
  Future<List<ExploreIslamModel>> getArtical() async {
    try {
      List<ExploreIslamModel> articals = [];
      final jsonData = await getAssetsData(AppKeys.exploreIslam);
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
