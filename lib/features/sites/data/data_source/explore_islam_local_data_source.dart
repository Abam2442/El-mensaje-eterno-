import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
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

    return Future.value(articals);
  }
}
