import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/entities/doaa_entity.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/usecases/get_azkar_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../domain/entities/azkar_entity.dart';
import '../../domain/usecases/get_doaas_use_case.dart';

class AzkarDoaaController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Data
  List<Azkar> azkar = [];
  Doaa? doaas;

  // States
  StateType getAzkarState = StateType.init;
  StateType getDoaaState = StateType.init;

  // Primitive
  String validationMessage = '';

  late TabController tabController;

  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Azkar'),
    const Tab(text: 'Doaas'),
  ];

  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit AzkarController");
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    await getAzkar();
    await getDoaas();
    Get.find<Logger>().w("End onInit AzkarController");
  }

  Future<void> getAzkar() async {
    Get.find<Logger>().i("Start `getAzkars` in |AzkarController|");
    getAzkarState = StateType.loading;
    update();
    GetAzkarUseCase getAzkarsUseCase = GetAzkarUseCase(Get.find());
    var result = await getAzkarsUseCase();
    result.fold(
      (l) async {
        getAzkarState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getAzkarState = StateType.init;
      },
      (r) {
        getAzkarState = StateType.success;
        azkar = r;
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getAzkars` in |AzkarController| $getAzkarState");
  }

  Future<void> getDoaas() async {
    Get.find<Logger>().i("Start `getDoaas` in |DoaaController|");
    getDoaaState = StateType.loading;
    update();
    GetDoaasUseCase getDoaasUseCase = GetDoaasUseCase(Get.find());
    var result = await getDoaasUseCase();
    result.fold(
      (l) async {
        getDoaaState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getDoaaState = StateType.init;
      },
      (r) {
        getDoaaState = StateType.success;
        doaas = r;
        update();
      },
    );
    Get.find<Logger>().w("End `getDoaas` in |DoaaController| $getAzkarState");
  }

  

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void goToNextPage(List azkar) {
    if (currentPage.value < azkar.length - 1) {
      currentPage.value++;
      pageController.animateToPage(currentPage.value, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.animateToPage(currentPage.value, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
}
