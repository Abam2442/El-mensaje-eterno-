import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';

import '../model/kids_model.dart';


class KidsController extends GetxController  {
  RxBool isLoading = true.obs;
  Rx< KidsModel> kidsModel=KidsModel().obs;
  RxInt LessonIndex =0.obs;

  @override
  Future<void> onInit() async {
   // Get.find<Logger>().i("Start onInit KidsController");
    super.onInit();
    await loadJsonFile();
    print('kids ......${kidsModel.value.lessons?[0].title}');

  }

  @override
  Future<void> onReady() async {
    await loadJsonFile();
    print('kidsre ......${kidsModel.value.lessons?[0].title}');
  }

  Future<void> loadJsonFile()async{
    String data = await  rootBundle.loadString('assets/json/Sp-kids.json');
    kidsModel.value = KidsModel.fromJson( await json.decode(data));
    print('kidsM ......${kidsModel.value.lessons?[0]}');
    isLoading.value = false;
  }

  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void goToNextPage(List<Content>? kids) {
    if (currentPage.value < kids!.length - 1) {
      currentPage.value++;
      pageController.animateToPage(currentPage.value,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.animateToPage(currentPage.value,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
}