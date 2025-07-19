import 'dart:convert';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/prophet/model/prophetModel.dart';

class ProphetController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLoading = true.obs;

  late TabController tabController;

  late List<Tab> tabs;
  StateType getLessonsState = StateType.init;
  @override
  void onInit() async {
    super.onInit();
    await  loadOfflineFile();
    tabs = [
      Tab(
        text: prophetModel.courses![0].title!,
      ),
      Tab(text: prophetModel.courses![1].title!),
    ];
    tabController = TabController(length: 2, vsync: this);

    getLessonsState = StateType.success;
  }

  Future<void> loadOfflineFile() async {
    try {
      final jsonString =await getAssetsData('Sp-biographyofprophet.json');
      prophetModel = ProphetModel.fromJson(jsonString);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  late ProphetModel prophetModel;
 
}
