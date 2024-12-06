import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:http/http.dart' as http;
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
          await http.get(Uri.parse('${AppApiRoutes.jsonApi}$fileName'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      finalData[sectionName].forEach((key, value) {
        articals.add(FixedEntities(
          name: key,
          content: value,
        ));
      });
      return articals;
    } catch (e) {
      rethrow;
    }
  }
}
