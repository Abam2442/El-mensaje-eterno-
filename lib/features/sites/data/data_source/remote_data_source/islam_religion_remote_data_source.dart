import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/islam_for_christians_entities.dart';
import 'package:http/http.dart' as http;
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/islam_religion_entities.dart';

abstract class IslamReligionRemoteDataSource {
  Future<List<IslamReligionEntities>> getOnlineContent();
}

class IslamReligionRemoteDataSourceImpl extends IslamReligionRemoteDataSource {
  @override
  Future<List<IslamReligionEntities>> getOnlineContent() async {
    try {
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamReligion}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      List<IslamReligionEntities> articals = [];
      finalData['islam-Religion'].forEach((key, value) {
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
      return articals;
    } catch (e) {
      rethrow;
    }
  }
}
