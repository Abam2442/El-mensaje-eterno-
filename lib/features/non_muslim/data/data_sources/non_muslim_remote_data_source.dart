import 'dart:convert';
import 'dart:developer';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_keys.dart';
import 'package:http/http.dart' as http;
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';

abstract class NonMuslimRemoteDataSource {
  Future<List<NonMuslimModel>> getOnlineData();
}

class NonMuslimRemoteDataSourceImpl extends NonMuslimRemoteDataSource {
  @override
  Future<List<NonMuslimModel>> getOnlineData() async {
    try {
      log('online Data');
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${AppKeys.nonMuslims}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = json.decode(jsonString);
      List<NonMuslimModel> hadithes = [];
      hadithes = finalData
          .map<NonMuslimModel>(
            (surah) => NonMuslimModel.fromJson(surah),
          )
          .toList();
      print({hadithes});
      return hadithes;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
