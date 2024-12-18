import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';

abstract class TerminologyLocalDataSource {
  Future<List<CategoryFixedEntity>> getArtical();
}

class TerminologyLocalDataSourceImp extends TerminologyLocalDataSource {
  @override
  Future<List<CategoryFixedEntity>> getArtical() async {
    final jsonData = await getOfflineData(AppKeys.terminology);
    List<CategoryFixedEntity> articals = [];
    jsonData.forEach((key, value) {
      List<FixedEntities> categoryFixedEntityData = [];
      value.forEach((key, value) => categoryFixedEntityData
          .add(FixedEntities(name: key, content: value)));

      articals.add(
          CategoryFixedEntity(category: key, data: categoryFixedEntityData));
    });
    return Future.value(articals);
  }
}
