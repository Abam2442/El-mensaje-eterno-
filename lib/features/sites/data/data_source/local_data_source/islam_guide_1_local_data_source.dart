// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../models/islam_guide_1_model.dart';

abstract class IslamGuide1LocalDataSource {
  Future<List<IslamGuide1>> getArtical();
}

class IslamGuide1LocalDataSourceImpl extends IslamGuide1LocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  IslamGuide1LocalDataSourceImpl({
    required this.sharedPreferencesService,
  });

  @override
  Future<List<IslamGuide1>> getArtical() async {
    try {
      // String? learningIslamJson =
      // await archiveService.readFile(name: AppKeys.islamGuide1);
      final jsonData = await getOfflineData(AppKeys.islamGuide1);

      List<Chapter0> chapter1 = [];
      List<Chapter0> chapter2 = [];
      List<Chapter0> chapter3 = [];
      // if (learningIslamJson != null) {
      // var jsonData = json.decode(learningIslamJson);
      jsonData['islam-guide-1']['Chapter-01'].forEach((a) {
        // IslamGuide1(chapter01: [
        // print(a);
        chapter1.add(Chapter0(title: a['Title'], paragraphs: a['Paragraphs']));
        // ]);
      });
      jsonData['islam-guide-1']['Chapter-02'].forEach((a) {
        // IslamGuide1(chapter01: [
        chapter2.add(Chapter0(title: a['Title'], paragraphs: a['Paragraphs']));
        // ]);
      });
      jsonData['islam-guide-1']['Chapter-03'].forEach((a) {
        // IslamGuide1(chapter01: [
        chapter3.add(Chapter0(title: a['Title'], paragraphs: a['Paragraphs']));
        // ]);
      });
      // }

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
