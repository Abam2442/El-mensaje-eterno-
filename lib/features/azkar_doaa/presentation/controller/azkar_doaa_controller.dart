import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/data/models/sonan_model.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/domain/usecases/get_azkar_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/doaa_model/doaa_model.dart';
import '../../domain/entities/azkar_entity.dart';
import '../../domain/usecases/get_doaas_use_case.dart';
import '../../domain/usecases/sonan_usecase.dart';

class AzkarDoaaController extends GetxController {
  // Data
  List<Azkar> azkar = [];
  List<DoaaModel> doaas = [];
  Sonan? sonan;

  // States
  StateType getAzkarState = StateType.init;
  StateType getSonanState = StateType.init;
  StateType getDoaaState = StateType.init;

  // Primitive
  String validationMessage = '';

  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    // Get.put(());
    await getAzkar();
    await getDoaas();
    await getSonan();
  }

  Future<void> getAzkar() async {
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
  }

  Future<void> getDoaas() async {
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
  }

  Future<void> getSonan() async {
    getDoaaState = StateType.loading;
    update();
    GetSonanUseCase getSonanUseCase = GetSonanUseCase(Get.find());
    var result = await getSonanUseCase();
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
        sonan = r;
        update();
      },
    );
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void goToNextPage(List azkar) {
    if (currentPage.value < azkar.length - 1) {
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
