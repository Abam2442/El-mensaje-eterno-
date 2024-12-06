import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future getOfflineData(String fileName) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/$fileName';
  final file = File(filePath);
  String jsonString = await file.readAsString();
  final jsonResponse = json.decode(jsonString);
  return jsonResponse;
}
