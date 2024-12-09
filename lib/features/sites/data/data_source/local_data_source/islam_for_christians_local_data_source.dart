import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/islam_for_christians_entities.dart';

abstract class IslamForChristiansLocalDataSource {
  Future<List<IslamForChristiansEntities>> getContent();
}

class IslamForChristiansLocalDataSourceImp
    extends IslamForChristiansLocalDataSource {
  @override
  Future<List<IslamForChristiansEntities>> getContent() async {
    final jsonData = await getOfflineData(AppKeys.islamForChristians);

    List<IslamForChristiansEntities> articals = [];

    jsonData['islam-for-christians'].forEach((key, value) {
      List<FixedEntities> subCatigory = [];

      jsonData['islam-for-christians'][key].forEach((key, value) {
        subCatigory.add(FixedEntities(name: key, content: value));
      });
      articals.add(IslamForChristiansEntities(
        name: key,
        subCatigory: subCatigory,
      ));
    });
    // }

    return Future.value(articals);
  }
}
