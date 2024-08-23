import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/giude_to_islam/articals/search/gude_to_islam_search.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/usecase/guide_to_islam_usecase.dart';

class GuideToIslamControllerImp extends GetxController {
  StateType getArticalState = StateType.init;
  List<FixedEntities> articals = [];
  // Primitive
  String validationMessage = '';

  GlobalKey<FormState> formState = GlobalKey();

  List<FixedEntities> searchResult = [];
  void searchFun(String val) {
    if (formState.currentState!.validate()) {
      searchResult.clear();
      for (var item in articals) {
        if (item.name.toLowerCase().contains(val.toLowerCase())) {
          searchResult.add(item);
        }
      }
      Get.to(() => const GuideToIslamSearch());
    }
  }

  Future<void> getContent() async {
    GuideToIslamUseCase guideToIslamUseCase = GuideToIslamUseCase(Get.find());
    var result = await guideToIslamUseCase.callContent();
    result.fold(
      (l) async {
        getArticalState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getArticalState = StateType.init;
      },
      (r) {
        getArticalState = StateType.success;
        articals = r;

        update();
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    await getContent();
  }
}
