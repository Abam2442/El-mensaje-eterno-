import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/model/faithModel.dart';
import 'package:hiwayda_oracion_islamica/features/faith/domain/usecases/faith_use_case.dart';

class FaithController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // RxBool isLoading = true.obs;

  late TabController tabController;

  late List<Tab> tabs;
  Rx<StateType> getLessonsState = StateType.init.obs;

  @override
  void onInit() async {
    super.onInit();
    await getData();
    tabs = [
      Tab(
        text: faithModel.courses![0].title!,
      ),
      Tab(text: faithModel.courses![1].title!),
    ];
    tabController = TabController(length: 2, vsync: this);

    getLessonsState.value = StateType.success;
  }

  late FaithModel faithModel;
  Future<void> getData() async {
    getLessonsState.value = StateType.loading;
    update();
    FaithUseCase getAzkarsUseCase = FaithUseCase(Get.find());
    var result = await getAzkarsUseCase();
    result.fold(
      (l) async {
        getLessonsState.value = getStateFromFailure(l);
        await Future.delayed(const Duration(milliseconds: 50));
        getLessonsState.value = StateType.init;
      },
      (r) {
        getLessonsState.value = StateType.success;
        faithModel = r;
      },
    );
  }

  // Future<void> loadJsonFile() async {
  //   String data = await rootBundle.loadString('assets/json/Sp-faith.json');
  //   faithModel = FaithModel.fromJson(await json.decode(data));
  //   isLoading.value = false;
  // }
}
