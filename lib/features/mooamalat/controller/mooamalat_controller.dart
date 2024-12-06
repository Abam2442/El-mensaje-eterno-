import 'dart:convert';
import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/model/mooamalatModel.dart';
import 'package:path_provider/path_provider.dart';

class MooamalatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLoading = true.obs;

  late TabController tabController;

  late List<Tab> tabs;
  StateType getLessonsState = StateType.init;
  @override
  void onInit() async {
    super.onInit();
    await checkOfflineFiles('Sp-moomlat.json')
        ? await loadJsonFile()
        : await loadOnlineFile();
    tabs = [
      Tab(
        text: mooamalatModel.courses![0].title!,
      ),
      Tab(text: mooamalatModel.courses![1].title!),
      Tab(text: mooamalatModel.courses![2].title!),
      Tab(text: mooamalatModel.courses![3].title!),
      Tab(text: mooamalatModel.courses![4].title!),
    ];
    tabController = TabController(length: 5, vsync: this);

    getLessonsState = StateType.success;
  }

  Future<void> loadOnlineFile() async {
    try {
      print('remote data');
      final response =
          await http.get(Uri.parse('${AppApiRoutes.jsonApi}Sp-moomlat.json'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = await jsonDecode(jsonString);
      mooamalatModel = MooamalatModel.fromJson(finalData);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  late MooamalatModel mooamalatModel;
  Future<void> loadJsonFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/Sp-moomlat.json';
    final file = File(filePath);
    String jsonString = await file.readAsString();
    final jsonResponse = await json.decode(jsonString);
    // pilersModel = PilersModel.fromJson(jsonResponse);
    mooamalatModel = MooamalatModel.fromJson(jsonResponse);

    isLoading.value = false;
  }
}
