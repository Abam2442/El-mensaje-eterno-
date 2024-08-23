import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/islam_message_entities.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/usecase/islam_message_usecase.dart';

class IslamMessageControllerImp extends GetxController {
  List<IslamMessageArticalEntities> articals = [];

  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<FormState> secondFormState = GlobalKey();

  List searchResult = [];
  void searchFun(String val) {
    if (formState.currentState!.validate()) {
      searchResult.clear();
      for (var item in articals) {
        if (item.name.toLowerCase().contains(val.toLowerCase())) {
          searchResult.add(item);
        }
      }
    }
  }

  void searchInFun(String val, int index) {
    if (secondFormState.currentState!.validate()) {
      searchResult.clear();

      for (var item in articals[index].subCatigory) {
        if (item.subArticalName.toLowerCase().contains(val.toLowerCase())) {
          searchResult.add(item);
        }
      }
    }
  }

  Future<void> getArtical() async {
    IslamMessageUseCase islamMessageUseCase = IslamMessageUseCase(Get.find());
    var result = await islamMessageUseCase.callArtical();
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
        print(articals[0].subCatigory[0].subArticalName);
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
