import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/pilers/model/pilersModel.dart';

class PilersController extends GetxController
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
        text: pilersModel.courses![0].title!,
      ),
      Tab(text: pilersModel.courses![1].title!),
      Tab(text: pilersModel.courses![2].title!),
    ];
    tabController = TabController(length: 3, vsync: this);

    getLessonsState = StateType.success;
  }

  late PilersModel pilersModel;
  Future<void> loadJsonFile() async {
    String data = await rootBundle.loadString('assets/json/Sp-pillers.json');
    pilersModel = PilersModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}
