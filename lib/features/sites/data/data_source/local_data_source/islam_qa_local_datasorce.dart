// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../models/islam_qa.dart';

abstract class IslamqaLocalDataSource {
  Future<List<Islamqa>> getArtical();
}

class IslamQALocalDataSourceImpl extends IslamqaLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  IslamQALocalDataSourceImpl({
    required this.sharedPreferencesService,
  });

  @override
  Future<List<Islamqa>> getArtical() async {
    try {
      // String? learningIslamJson =
      // await archiveService.readFile(name: AppKeys.islamQA);
      final jsonData = await getOfflineData(AppKeys.islamQA);

      List<Islamqa> articals = [];
      // if (learningIslamJson != null) {
      // var jsonData = json.decode(learningIslamJson);
      articals = jsonData['islamqa']
          .map<Islamqa>(
            (artical) => Islamqa.fromJson(artical),
          )
          .toList();
      // }

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }
}
