import 'dart:convert';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../models/learning_islam_model.dart';

abstract class LearningIslamLocalDataSource {
  Future<List<LearningIslamModel>> getArtical();
}

class LearningIslamLocalDataSourceImpl extends LearningIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  LearningIslamLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<LearningIslamModel>> getArtical() async {
    try {
      Get.find<Logger>()
          .i("Start `getArtical` in |LearningIslamLocalDataSourceImpl|");
      String? learningIslamJson =
          await archiveService.readFile(name: AppKeys.learningIslam);
      List<LearningIslamModel> articals = [];
      if (learningIslamJson != null) {
        var jsonData = json.decode(learningIslamJson);
        articals = jsonData['learning-islam']
            .map<LearningIslamModel>(
              (artical) => LearningIslamModel.fromJson(artical),
            )
            .toList();
      }
      Get.find<Logger>()
          .w("End `getArtical` in |LearningIslamLocalDataSourceImpl|");
      return Future.value(articals);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getArtical` in |LearningIslamLocalDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
