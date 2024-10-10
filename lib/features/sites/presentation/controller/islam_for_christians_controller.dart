import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_for_christians/search/islam_for_christians_search.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_for_christians/search/islam_for_christians_title_search.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/islam_for_christians_entities.dart';
import '../../domain/usecase/islam_for_christians_usecase.dart';

class IslamForChristiansControllerImp extends GetxController {
  List<IslamForChristiansEntities> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  GlobalKey<FormState> firstFormState = GlobalKey();
  GlobalKey<FormState> secondFormState = GlobalKey();

  List searchResult = [];
  void searchFun(String val, target, bool isGategory) {
    if (isGategory
        ? secondFormState.currentState!.validate()
        : firstFormState.currentState!.validate()) {
      searchResult.clear();
      for (var item in target) {
        if (item.name.toLowerCase().contains(val.toLowerCase())) {
          searchResult.add(item);
        }
      }
      Get.to(() => !isGategory
          ? const IslamForChristiansSearch()
          : IslamForChristiansTitleSearch(
              dataText: searchResult,
            ));
    }
  }

  Future<void> getArtical() async {
    IslamForChristiansUseCase islamForChristiansUseCase =
        IslamForChristiansUseCase(Get.find());
    var result = await islamForChristiansUseCase();
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
