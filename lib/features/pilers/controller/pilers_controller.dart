import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
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
    await loadOfflineFile();
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

  Future<void> loadOfflineFile() async {
    try {
      print('Sp-pillers.json');
      final finalData = await getAssetsData('Sp-pillers.json');
      pilersModel = PilersModel.fromJson(finalData);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
