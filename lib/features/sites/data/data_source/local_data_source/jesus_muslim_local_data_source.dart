import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/jesus_muslim_model.dart';

abstract class JesusMuslimLocalDataSource {
  Future<List<JesusMuslimModel>> getArtical();
}

class JesusMuslimLocalDataSourceImp extends JesusMuslimLocalDataSource {
  @override
  Future<List<JesusMuslimModel>> getArtical() async {
    final jsonData = await getAssetsData(AppKeys.jesusMuslim);

    List<JesusMuslimModel> articals = [];
    articals = jsonData['Jesus-is-muslim']
        .map<JesusMuslimModel>(
          (artical) => JesusMuslimModel.fromJson(artical),
        )
        .toList();
    // }

    return Future.value(articals);
  }
}
