import 'dart:convert';
// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../models/islam_qa.dart';

abstract class IslamQALocalDataSource {
  Future<List<Islamqa>> getArtical();
}

class IslamQALocalDataSourceImpl extends IslamQALocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  IslamQALocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<Islamqa>> getArtical() async {
    try {
      Get.find<Logger>()
          .i("Start `getArtical` in |IslamQALocalDataSourceImpl|");
      String? learningIslamJson =
          await archiveService.readFile(name: AppKeys.islamQA);
      List<Islamqa> articals = [];
      if (learningIslamJson != null) {
        var jsonData = json.decode(learningIslamJson);
        articals = jsonData['islamqa']
            .map<Islamqa>(
              (artical) => Islamqa.fromJson(artical),
            )
            .toList();
      }
      Get.find<Logger>().w("End `getArtical` in |IslamQALocalDataSourceImpl|");
      return Future.value(articals);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getArtical` in |IslamQALocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
