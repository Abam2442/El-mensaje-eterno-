import 'dart:convert';

import 'package:flutter/services.dart';

Future getAssetsData(String fileName) async {
  final response = await rootBundle.loadString('assets/json/$fileName');
  final jsonString = json.decode(response);
  return jsonString;
}
