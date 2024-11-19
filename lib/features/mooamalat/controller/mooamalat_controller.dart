import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/model/mooamalatModel.dart';

class MooamalatController extends GetxController
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

  late MooamalatModel mooamalatModel;
  Future<void> loadJsonFile() async {
    String data = await rootBundle.loadString('assets/json/Sp-moomlat.json');
    mooamalatModel = MooamalatModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}
