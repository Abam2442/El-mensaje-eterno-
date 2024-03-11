import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../models/explore_islam_model.dart';

abstract class ExploreIslamLocalDataSource {
  Future<List<ExploreIslamModel>> getArtical();
}

class ExploreIslamLocalDataSourceImp extends ExploreIslamLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  ExploreIslamLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<ExploreIslamModel>> getArtical() async {
    Get.find<Logger>()
        .i("Start `getArtical` in |ExploreIslamLocalDataSourceImp|");
    String? fileContent =
        await archiveService.readFile(name: AppKeys.exploreIslam);
    List<ExploreIslamModel> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      articals = jsonData['explore-islam']
          .map<ExploreIslamModel>(
            (artical) => ExploreIslamModel.fromJson(artical),
          )
          .toList();
    }
    Get.find<Logger>()
        .w("End `getArtical` in |ExploreIslamLocalDataSourceImp|");
    return Future.value(articals);
  }
}
