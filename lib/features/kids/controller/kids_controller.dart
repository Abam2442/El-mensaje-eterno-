import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/kids/model/kids_model.dart';
import 'package:http/http.dart' as http;

class KidsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLoading = true.obs;
  late TabController tabController;
  late List<Tab> tabs;
  StateType getLessonsState = StateType.init;
  @override
  void onInit() async {
    super.onInit();
    await checkOfflineFiles('Sp-kids.json');
    await loadJsonFile();
    getLessonsState = StateType.success;
  }

  late KidsModel kidsModel;
  Future<void> loadOnlineFile() async {
    try {
      print('remote data');
      final response =
          await http.get(Uri.parse('${AppApiRoutes.jsonApi}Sp-kids.json'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = await jsonDecode(jsonString);
      kidsModel = KidsModel.fromJson(finalData);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadJsonFile() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/json/Sp-kids.json');
      final jsonResponse = await json.decode(jsonString);
      kidsModel = KidsModel.fromJson(jsonResponse);
      isLoading.value = false;
    } catch (e) {
      print('Error loading JSON file: $e');
      isLoading.value = false;
    }
  }
}
