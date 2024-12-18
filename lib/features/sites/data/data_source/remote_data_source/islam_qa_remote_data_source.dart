import 'dart:convert';
import 'dart:developer';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:http/http.dart' as http;
import 'package:hiwayda_oracion_islamica/features/sites/data/models/islam_qa.dart';

abstract class IslamQaRemoteDataSource {
  Future<List<Islamqa>> getOnlineArtical();
}

class IslamQaRemoteDataSourceImpl extends IslamQaRemoteDataSource {
  @override
  Future<List<Islamqa>> getOnlineArtical() async {
    try {
      List<Islamqa> articals = [];
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.islamQA}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      print(finalData);
      articals = finalData['Español']
          .map<Islamqa>(
            (artical) => Islamqa.fromJson(artical),
          )
          .toList();
      return articals;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
