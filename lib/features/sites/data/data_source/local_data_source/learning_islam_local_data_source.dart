import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../models/learning_islam_model.dart';

abstract class LearningIslamLocalDataSource {
  Future<List<LearningIslamModel>> getArtical();
}

class LearningIslamLocalDataSourceImpl extends LearningIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  LearningIslamLocalDataSourceImpl({
    required this.sharedPreferencesService,
  });

  @override
  Future<List<LearningIslamModel>> getArtical() async {
    try {
      // String? learningIslamJson =
      // await archiveService.readFile(name: AppKeys.learningIslam);
      final jsonData = await getOfflineData(AppKeys.learningIslam);

      List<LearningIslamModel> articals = [];
      // if (learningIslamJson != null) {
      // var jsonData = json.decode(learningIslamJson);
      articals = jsonData['learning-islam']
          .map<LearningIslamModel>(
            (artical) => LearningIslamModel.fromJson(artical),
          )
          .toList();
      // }

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }
}
