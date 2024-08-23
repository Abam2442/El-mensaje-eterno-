import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/saber_el_islam/search/saber_el_islam_search.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../data/models/saber_el_islam_model.dart';
import '../../domain/usecase/saber_el_islam_usecase.dart';

class SaberElIslamControllerImp extends GetxController {
  List<SaberElIslamModel> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  GlobalKey<FormState> formState = GlobalKey();
  List<SEIArtical> searchResult = [];

  void searchFun(String val) {
    if (formState.currentState!.validate()) {
      searchResult.clear();
      for (var item in articals) {
        for (var item1 in item.articals) {
          if (item1.title.toLowerCase().contains(val.toLowerCase())) {
            searchResult.add(item1);
          }
        }
      }
      Get.to(() => const SaberElIslamSearch());
    }
  }

  Future<void> getArtical() async {
    SaberElIslamUseCase saberElIslamUseCase = SaberElIslamUseCase(Get.find());
    var result = await saberElIslamUseCase();
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
