import 'dart:convert';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/archive_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../models/jesus_muslim_model.dart';

abstract class JesusMuslimLocalDataSource {
  Future<List<JesusMuslimModel>> getArtical();
}

class JesusMuslimLocalDataSourceImp extends JesusMuslimLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  JesusMuslimLocalDataSourceImp({
    required this.sharedPreferencesService,
    required this.archiveService,
  });
  @override
  Future<List<JesusMuslimModel>> getArtical() async {
    String? fileContent =
        await archiveService.readFile(name: AppKeys.jesusMuslim);
    List<JesusMuslimModel> articals = [];
    if (fileContent != null) {
      Map jsonData = json.decode(fileContent);
      articals = jsonData['Jesus-is-muslim']
          .map<JesusMuslimModel>(
            (artical) => JesusMuslimModel.fromJson(artical),
          )
          .toList();
    }

    return Future.value(articals);
  }
}
