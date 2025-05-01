import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/model/faithModel.dart';
import 'package:path_provider/path_provider.dart';
abstract class FaithLocalDataSource {
  Future<FaithModel> getOfflineData();
}

class FaithLocalDataSourceImpl extends FaithLocalDataSource {
  @override
  Future<FaithModel> getOfflineData() async {
    try {
      // Get the application documents directory
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/Sp-faith.json';
      final file = File(filePath);
      if (await file.exists()) {
        String jsonString = await file.readAsString();
        final jsonResponse = json.decode(jsonString);
        return FaithModel.fromJson(jsonResponse);
      } else {
        log('File [Sp-faith.json] does not exist in documents directory, copying from assets');
        final String assetData = await rootBundle.loadString('assets/json/Sp-faith.json');
        await file.writeAsString(assetData);
        final jsonResponse = json.decode(assetData);
        return FaithModel.fromJson(jsonResponse);
      }
    } catch (e) {
      print('Error loading file: $e');
      log('local data source called failed');
      rethrow;
    }
  }
}
