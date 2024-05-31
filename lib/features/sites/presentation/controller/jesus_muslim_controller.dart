import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/jesus_is_muslim/search/jesus_muslim_search.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/jesus_muslim_entities.dart';
import '../../domain/usecase/jesus_muslim_usecase.dart';

class JesusMuslimControllerImp extends GetxController {
  List<JesusMuslimEntities> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  GlobalKey<FormState> formState = GlobalKey();

  // Primitive
  String validationMessage = '';

  List searchResult = [];

  void searchArticle(String val, target) {
    if (formState.currentState!.validate()) {
      searchResult.clear();
      for (var item in target) {
        if (item.name.toLowerCase().contains(val.toLowerCase())) {
          searchResult.add(item);
        }
      }
      Get.to(() => const JesusMuslimSearch());
    }
  }

  Future<void> getArtical() async {
    JesusMuslimUseCase jesusMuslimUseCase = JesusMuslimUseCase(Get.find());
    var result = await jesusMuslimUseCase();
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
