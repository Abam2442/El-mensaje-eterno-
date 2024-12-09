import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_online_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/islam_for_christians_entities.dart';

abstract class IslamForChrictiansRemoteDataSource {
  Future<List<IslamForChristiansEntities>> getOnlineContent();
}

class IslamForChrictiansRemoteDataSourceImpl
    extends IslamForChrictiansRemoteDataSource {
  @override
  Future<List<IslamForChristiansEntities>> getOnlineContent() async {
    try {
      List<IslamForChristiansEntities> articals = [];

      final jsonData = await getOnlineData(AppKeys.islamForChristians);
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
      return articals;
    } catch (e) {
      rethrow;
    }
  }
}
