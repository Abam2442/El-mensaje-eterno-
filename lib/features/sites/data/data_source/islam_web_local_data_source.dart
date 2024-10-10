import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../models/islam_web_model.dart';

abstract class IslamWebLocalDataSource {
  Future<List<IslamWebModel>> getArtical();
}

class IslamWebLocalDataSourceImpl extends IslamWebLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  IslamWebLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<IslamWebModel>> getArtical() async {
    try {
      String? islamWebJson =
          await archiveService.readFile(name: AppKeys.islamWeb);
      List<IslamWebModel> articals = [];
      if (islamWebJson != null) {
        var jsonData = json.decode(islamWebJson);
        articals = jsonData['islamweb']
            .map<IslamWebModel>(
              (artical) => IslamWebModel.fromJson(artical),
            )
            .toList();
      }

      return Future.value(articals);
    } catch (e) {
      rethrow;
    }
  }
}
