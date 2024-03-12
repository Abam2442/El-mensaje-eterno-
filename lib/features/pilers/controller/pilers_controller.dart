import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/features/pilers/model/pilersModel.dart';
import 'package:logger/logger.dart';

class PilersController extends GetxController with GetSingleTickerProviderStateMixin{

  RxBool isLoading = true.obs;

  late TabController tabController;

  late List<Tab> tabs;
  StateType getLessonsState = StateType.init;
  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit PilersController");
    super.onInit();
    await loadJsonFile();
    tabs = [
      Tab(text: pilersModel.courses![0].title!,),
      Tab(text: pilersModel.courses![1].title!),
      Tab(text: pilersModel.courses![2].title!),
    ];
    tabController = TabController(length: 3, vsync: this);
    Get.find<Logger>().w("End onInit PilersController");
    getLessonsState = StateType.success;

  }
  late PilersModel pilersModel;
  Future<void> loadJsonFile()async{
    String data = await  rootBundle.loadString('assets/json/Sp-pillers.json');
    pilersModel = PilersModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}