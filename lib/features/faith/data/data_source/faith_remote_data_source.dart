import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/model/faithModel.dart';
import 'package:http/http.dart' as http;

abstract class FaithRemoteDataSource {
  Future<FaithModel> getOnlineData();
}

class FaithRemoteDataSourceImpl extends FaithRemoteDataSource {
  @override
  Future<FaithModel> getOnlineData() async {
    final response =
        await http.get(Uri.parse('${AppApiRoutes.jsonApi}Sp-faith.json'));
    final jsonString = utf8.decode(response.bodyBytes);
    final finalData = await json.decode(jsonString);
    print(finalData);
    return FaithModel.fromJson(finalData);
  }
}
