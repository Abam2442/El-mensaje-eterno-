import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/usecase/islam_faith_usecase.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_faith/search/islam_faith_search.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/fixed_entities.dart';

class IslamFaithControllerImp extends GetxController {
  List<FixedEntities> articals = [];
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
        if (item.name.toLowerCase().contains(val.toLowerCase())) {
          searchResult.add(item);
        }
      }
      Get.to(() => const IslamFaithSearch());
    }
  }

  Future<void> getArtical() async {
    IslamFaithUseCase islamFaithUseCase = IslamFaithUseCase(Get.find());
    var result = await islamFaithUseCase();
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
