import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    await loadJsonFile();
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

  late NewLifeModel newLifeModel;
  Future<void> loadJsonFile() async {
    String data = await rootBundle.loadString('assets/json/Sp-newlife.json');
    newLifeModel = NewLifeModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}
