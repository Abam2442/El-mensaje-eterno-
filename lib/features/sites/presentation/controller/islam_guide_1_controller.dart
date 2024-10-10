import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_guide_1/search/islam_guide_search.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../data/models/islam_guide_1_model.dart';
import '../../domain/usecase/islam_guide_1_usecase.dart';

class IslamGuide1ControllerImp extends GetxController {
  List<IslamGuide1> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';
  GlobalKey<FormState> formState = GlobalKey();

  List searchResult = [];

  void searchFun(String val) {
    if (formState.currentState!.validate()) {
      searchResult.clear();
      for (var item in articals) {
        for (var item1 in item.chapters) {
          if (item1.title.toLowerCase().contains(val.toLowerCase())) {
            searchResult.add(item1);
          }
        }
      }
      Get.to(() => const IslamGuideSearch());
    }
  }

  Future<void> getArtical() async {
    IslamGuide1UseCase islamGuide1UseCase = IslamGuide1UseCase(Get.find());
    var result = await islamGuide1UseCase();
    result.fold(
      (l) async {
        getArticalsState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getArticalsState = StateType.init;
      },
      (r) {
        getArticalsState = StateType.success;
        articals = r;

        update();
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    await getArtical();
  }
}
