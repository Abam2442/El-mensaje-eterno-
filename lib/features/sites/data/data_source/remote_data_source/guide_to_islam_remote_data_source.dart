import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_online_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';

abstract class GuideToIslamRemoteDataSource {
  Future<List<FixedEntities>> getOnlineContect();
}

class GuideToIslamRemoteDataSourceImpl extends GuideToIslamRemoteDataSource {
  @override
  Future<List<FixedEntities>> getOnlineContect() async {
    try {
      final jsonData = await getOnlineData(AppKeys.guideToIslam);
      List<FixedEntities> articals = [];
      var jsonguide = jsonData['guide-to-islam'][0] as Map;
      jsonguide['Articles'].forEach((key, value) {
        articals.add(FixedEntities(
          name: key,
          content: value,
        ));
      });
      return articals;
    } catch (e) {
      rethrow;
    }
  }
}
