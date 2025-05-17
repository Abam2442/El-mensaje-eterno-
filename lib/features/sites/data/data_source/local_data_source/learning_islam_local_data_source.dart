import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/learning_islam_model.dart';

abstract class LearningIslamLocalDataSource {
  Future<List<LearningIslamModel>> getArtical();
}

class LearningIslamLocalDataSourceImpl extends LearningIslamLocalDataSource {
  @override
  Future<List<LearningIslamModel>> getArtical() async {
    try {
      final jsonData = await getOfflineData(AppKeys.learningIslam);

      List<LearningIslamModel> articals = [];
      articals = jsonData['learning-islam']
          .map<LearningIslamModel>(
            (artical) => LearningIslamModel.fromJson(artical),
          )
          .toList();

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }
}
