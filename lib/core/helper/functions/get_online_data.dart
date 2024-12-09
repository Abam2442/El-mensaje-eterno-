import 'dart:convert';

import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:http/http.dart' as http;

Future getOnlineData(String fileName) async {
  final response =
      await http.get(Uri.parse('${AppApiRoutes.jsonApi}$fileName'));
  final jsonString = utf8.decode(response.bodyBytes);
  final finalData = json.decode(jsonString);
  return finalData;
}
