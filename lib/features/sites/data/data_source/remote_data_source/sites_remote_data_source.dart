import 'dart:developer';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';

abstract class SitesRemoteDataSource {
  Future<List<FixedEntities>> getOnlineData(
      String fileName, String sectionName);
}

class SitesRemoteDataSourceImpl extends SitesRemoteDataSource {
  @override
  Future<List<FixedEntities>> getOnlineData(
    String fileName,
    sectionName,
  ) async {
    try {
      List<FixedEntities> articals = [];

      final response =
          await getOfflineData(fileName);
      response[sectionName].forEach((key, value) {
        articals.add(FixedEntities(
          name: key,
          content: value,
        ));
      });
      return articals;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
