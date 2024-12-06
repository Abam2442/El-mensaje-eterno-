import 'dart:convert';
import 'dart:io';

import 'package:hiwayda_oracion_islamica/features/faith/data/model/faithModel.dart';
import 'package:path_provider/path_provider.dart';

abstract class FaithLocalDataSource {
  Future<FaithModel> getOfflineData();
}

class FaithLocalDataSourceImpl extends FaithLocalDataSource {
  @override
  Future<FaithModel> getOfflineData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/Sp-faith.json';
      final file = File(filePath);
      String jsonString = await file.readAsString();
      final jsonResponse = json.decode(jsonString);
      return FaithModel.fromJson(await json.decode(jsonResponse));
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
