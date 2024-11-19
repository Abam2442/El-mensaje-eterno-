import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    await loadJsonFile();
    tabs = [
      Tab(
        text: prophetModel.courses![0].title!,
      ),
      Tab(text: prophetModel.courses![1].title!),
    ];
    tabController = TabController(length: 2, vsync: this);

    getLessonsState = StateType.success;
  }

  late ProphetModel prophetModel;
  Future<void> loadJsonFile() async {
    String data =
        await rootBundle.loadString('assets/json/Sp-biographyofprophet.json');
    prophetModel = ProphetModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}
