import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/zad_daeia_entity.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/usecase/get_zads_usecase.dart';

class ZadDaeiaController extends GetxController {
  static ZadDaeiaController get instance => Get.find<ZadDaeiaController>();
  // Data
  List<ZadDaeiaEntity> topics = [];

  // States
  StateType getZadState = StateType.init;

  // Primitive
  String validationMessage = '';

  @override
  void onInit() async {
    super.onInit();
    await getZadTopics();
  }

  Future<void> getZadTopics() async {
    getZadState = StateType.loading;
    update();
    GetZadsUsecase getZadsUsecase = GetZadsUsecase(Get.find());
    var result = await getZadsUsecase();
    result.fold(
      (l) async {
        getZadState = getStateFromFailure(l);
        debugPrint(getZadState.toString());
        validationMessage = l.message;
        debugPrint(validationMessage);
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        // getZadState = StateType.init;
      },
      (r) {
        getZadState = StateType.success;
        topics = r;
        print("topics: " + topics.length.toString());
        update();
      },
    );
  }
}
