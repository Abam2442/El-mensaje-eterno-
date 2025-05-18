import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import '../../../../../core/constants/app_keys.dart';
import '../../models/islam_qa.dart';

abstract class IslamqaLocalDataSource {
  Future<List<Islamqa>> getArtical();
}

class IslamQALocalDataSourceImpl extends IslamqaLocalDataSource {
  @override
  Future<List<Islamqa>> getArtical() async {
      List<Islamqa> articals = [];
    try {
      final jsonData = await getOfflineData(AppKeys.islamQA);
      articals = jsonData['Español']
          .map<Islamqa>(
            (artical) => Islamqa.fromJson(artical),
          )
          .toList();

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }
}
