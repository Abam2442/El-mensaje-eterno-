import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/islam_guide_1_model.dart';

abstract class IslamGuide1LocalDataSource {
  Future<List<IslamGuide1>> getArtical();
}

class IslamGuide1LocalDataSourceImpl extends IslamGuide1LocalDataSource {
  @override
  Future<List<IslamGuide1>> getArtical() async {
    try {
      final jsonData = await getOfflineData(AppKeys.islamGuide1);

      List<Chapter0> chapter1 = [];
      List<Chapter0> chapter2 = [];
      List<Chapter0> chapter3 = [];
      jsonData['islam-guide-1']['Chapter-01'].forEach((a) {
        chapter1.add(Chapter0(title: a['Title'], paragraphs: a['Paragraphs']));
      });
      jsonData['islam-guide-1']['Chapter-02'].forEach((a) {
        chapter2.add(Chapter0(title: a['Title'], paragraphs: a['Paragraphs']));
      });
      jsonData['islam-guide-1']['Chapter-03'].forEach((a) {
        chapter3.add(Chapter0(title: a['Title'], paragraphs: a['Paragraphs']));
      });

      var islamGuide1 = IslamGuide1(
        chapters: chapter1,
      );
      var islamGuide2 = IslamGuide1(
        chapters: chapter2,
      );
      var islamGuide3 = IslamGuide1(
        chapters: chapter3,
      );

      return Future.value([islamGuide1, islamGuide2, islamGuide3]);
    } catch (e) {
      rethrow;
    }
  }
}
