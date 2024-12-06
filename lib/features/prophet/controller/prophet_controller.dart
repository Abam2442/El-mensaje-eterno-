import 'dart:convert';
import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/prophet/model/prophetModel.dart';
import 'package:path_provider/path_provider.dart';

class ProphetController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLoading = true.obs;

  late TabController tabController;

  late List<Tab> tabs;
  StateType getLessonsState = StateType.init;
  @override
  void onInit() async {
    super.onInit();
    await checkOfflineFiles('Sp-biographyofprophet.json')
        ? await loadJsonFile()
        : await loadOnlineFile();
    tabs = [
      Tab(
        text: prophetModel.courses![0].title!,
      ),
      Tab(text: prophetModel.courses![1].title!),
    ];
    tabController = TabController(length: 2, vsync: this);

    getLessonsState = StateType.success;
  }

  Future<void> loadOnlineFile() async {
    try {
      print('remote data');
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}Sp-biographyofprophet.json'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = await jsonDecode(jsonString);
      prophetModel = ProphetModel.fromJson(finalData);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  late ProphetModel prophetModel;
  Future<void> loadJsonFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/Sp-biographyofprophet.json';
    final file = File(filePath);
    String jsonString = await file.readAsString();
    final jsonResponse = json.decode(jsonString);
    prophetModel = ProphetModel.fromJson(jsonResponse);
    isLoading.value = false;
  }
}
