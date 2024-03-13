import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/model/mooamalatModel.dart';
import 'package:logger/logger.dart';

class MooamalatController extends GetxController with GetSingleTickerProviderStateMixin{

  RxBool isLoading = true.obs;

  late TabController tabController;

  late List<Tab> tabs;
  StateType getLessonsState = StateType.init;
  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit MooamalatController");
    super.onInit();
    await loadJsonFile();
    tabs = [
      Tab(text: mooamalatModel.courses![0].title!,),
      Tab(text: mooamalatModel.courses![1].title!),
      Tab(text: mooamalatModel.courses![2].title!),
      Tab(text: mooamalatModel.courses![3].title!),
      Tab(text: mooamalatModel.courses![4].title!),
    ];
    tabController = TabController(length: 5, vsync: this);
    Get.find<Logger>().w("End onInit MooamalatController");
    getLessonsState = StateType.success;

  }
  late MooamalatModel mooamalatModel;
  Future<void> loadJsonFile()async{
    String data = await  rootBundle.loadString('assets/json/Sp-moomlat.json');
    mooamalatModel = MooamalatModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}