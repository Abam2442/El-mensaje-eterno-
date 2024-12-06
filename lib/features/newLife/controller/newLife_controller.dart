import 'dart:convert';
import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/newLife/model/newLifeModel.dart';
import 'package:path_provider/path_provider.dart';

class NewLifeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLoading = true.obs;

  late TabController tabController;

  late List<Tab> tabs;
  StateType getLessonsState = StateType.init;
  @override
  void onInit() async {
    super.onInit();
    await checkOfflineFiles('Sp-newlife.json')
        ? await loadJsonFile()
        : await loadOnlineFile();
    tabs = [
      Tab(
        text: newLifeModel.courses![0].title!,
      ),
      Tab(text: newLifeModel.courses![1].title!),
      Tab(text: newLifeModel.courses![2].title!),
      Tab(text: newLifeModel.courses![3].title!),
    ];
    tabController = TabController(length: 4, vsync: this);

    getLessonsState = StateType.success;
  }

  Future<void> loadOnlineFile() async {
    try {
      print('remote data');
      final response =
          await http.get(Uri.parse('${AppApiRoutes.jsonApi}Sp-newlife.json'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = await jsonDecode(jsonString);
      newLifeModel = NewLifeModel.fromJson(finalData);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  late NewLifeModel newLifeModel;
  Future<void> loadJsonFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/Sp-newlife.json';
    final file = File(filePath);
    String jsonString = await file.readAsString();
    final jsonResponse = json.decode(jsonString);
    newLifeModel = NewLifeModel.fromJson(jsonResponse);

    isLoading.value = false;
  }
}
