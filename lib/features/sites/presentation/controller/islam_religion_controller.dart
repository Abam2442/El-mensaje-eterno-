import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/islam_religion_entities.dart';
import '../../domain/usecase/islam_religion_usecase.dart';

class IslamReligionControllerImp extends GetxController {
  List<IslamReligionEntities> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  GlobalKey<FormState> firstFormState = GlobalKey();
  GlobalKey<FormState> secondFormState = GlobalKey();
  GlobalKey<FormState> lastFormState = GlobalKey();

  List searchResult = [];
  void searchFun(String val, target, int screen) {
    if (screen == 0
        ? firstFormState.currentState!.validate()
        : screen == 1
            ? secondFormState.currentState!.validate()
            : lastFormState.currentState!.validate()) {
      searchResult.clear();
      for (var item in target) {
        if (item.name.toLowerCase().contains(val.toLowerCase())) {
          searchResult.add(item);
        }
      }
    }
  }

  Future<void> getArtical() async {
    IslamReligionUseCase islamReligionUseCase =
        IslamReligionUseCase(Get.find());
    var result = await islamReligionUseCase();
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
