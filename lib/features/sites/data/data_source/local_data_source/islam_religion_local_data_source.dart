import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';

import '../../../../../core/constants/app_keys.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../../domain/entities/islam_for_christians_entities.dart';
import '../../../domain/entities/islam_religion_entities.dart';

abstract class IslamReligionLocalDataSource {
  Future<List<IslamReligionEntities>> getContent();
}

class IslamReligionLocalDataSourceImp extends IslamReligionLocalDataSource {
  @override
  Future<List<IslamReligionEntities>> getContent() async {
    final jsonData = await getOfflineData(AppKeys.islamReligion);

    List<IslamReligionEntities> articals = [];

    jsonData['islam-Religion'].forEach((key, value) {
      List<IslamForChristiansEntities> catigory = [];

      value.forEach((key, value) {
        List<FixedEntities> subCatigory = [];
        value.forEach((key, value) {
          subCatigory.add(FixedEntities(name: key, content: value));
        });
        catigory.add(IslamForChristiansEntities(
          name: key,
          subCatigory: subCatigory,
        ));
      });
      articals.add(IslamReligionEntities(
        name: key,
        catigory: catigory,
      ));
    });

    return Future.value(articals);
  }
}
