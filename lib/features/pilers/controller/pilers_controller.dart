import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/pilers/model/pilersModel.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PilersController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLoading = true.obs;

  late TabController tabController;

  late List<Tab> tabs;
  StateType getLessonsState = StateType.init;
  @override
  void onInit() async {
    super.onInit();
    await checkOfflineFiles('Sp-pillers.json')
        ? await loadJsonFile()
        : await loadOnlineFile();
    tabs = [
      Tab(
        text: pilersModel.courses![0].title!,
      ),
      Tab(text: pilersModel.courses![1].title!),
      Tab(text: pilersModel.courses![2].title!),
    ];
    tabController = TabController(length: 3, vsync: this);

    getLessonsState = StateType.success;
  }

  late PilersModel pilersModel;

  Future<void> loadOnlineFile() async {
    try {
      print('remote data');
      final response =
          await http.get(Uri.parse('${AppApiRoutes.jsonApi}Sp-pillers.json'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = await jsonDecode(jsonString);
      pilersModel = PilersModel.fromJson(finalData);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadJsonFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/Sp-pillers.json';
    final file = File(filePath);
    String jsonString = await file.readAsString();
    final jsonResponse = await json.decode(jsonString);
    pilersModel = PilersModel.fromJson(jsonResponse);
    isLoading.value = false;
  }
}
