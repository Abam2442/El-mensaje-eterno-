import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';

import '../../../domain/entities/fixed_entities.dart';

abstract class TerminologyLocalDataSource {
  Future<List<FixedEntities>> getArtical();
}

class TerminologyLocalDataSourceImp extends TerminologyLocalDataSource {
  @override
  Future<List<FixedEntities>> getArtical() async {
    List<FixedEntities> articals = [];
    final jsonData = await getOfflineData(AppKeys.terminology);
    jsonData['terminology'].forEach((key, value) {
      articals.add(FixedEntities(name: key, content: value));
    });
    return Future.value(articals);
  }
}
