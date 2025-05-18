import 'dart:convert';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/newLife/model/newLifeModel.dart';

class NewLifeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLoading = true.obs;

  late TabController tabController;

  late List<Tab> tabs;
  StateType getLessonsState = StateType.init;
  @override
  void onInit() async {
    super.onInit();
    await loadOfflineFile();
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

  Future<void> loadOfflineFile() async {
    try {
      print('Sp-newlife.json');
      final response =
          await getAssetsData('Sp-newlife.json');
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = await jsonDecode(jsonString);
      newLifeModel = NewLifeModel.fromJson(finalData);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  late NewLifeModel newLifeModel;
 
}
