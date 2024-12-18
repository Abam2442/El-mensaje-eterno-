import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_online_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';

abstract class TerminologyRemoteDataSource {
  Future<List<CategoryFixedEntity>> getOnlineArtical();
}

class TerminologyRemoteDataSourceImpl extends TerminologyRemoteDataSource {
  @override
  Future<List<CategoryFixedEntity>> getOnlineArtical() async {
    try {
      final jsonData = await getOnlineData(AppKeys.terminology);
      List<CategoryFixedEntity> articals = [];
      jsonData.forEach((key, value) {
        List<FixedEntities> categoryFixedEntityData = [];
        value.forEach((key, value) => categoryFixedEntityData
            .add(FixedEntities(name: key, content: value)));

        articals.add(
            CategoryFixedEntity(category: key, data: categoryFixedEntityData));
      });
      return articals;
    } catch (e) {
      rethrow;
    }
  }
}
