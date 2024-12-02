import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/usecase/fixed_category_usecase.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/terminology/terminology_search.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/usecase/fixed_usecase.dart';

class TerminologyControllerImp extends GetxController {
  List<CategoryFixedEntity> articals = [];
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
        if (item.category.toLowerCase().contains(val.toLowerCase())) {
          searchResult.add(item);
        }
      }
      Get.to(() => const TerminologySearch());
    }
  }

  Future<void> getArtical() async {
    FixedCategoryUsecase terminologyUseCase = FixedCategoryUsecase(Get.find());
    var result = await terminologyUseCase();
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
