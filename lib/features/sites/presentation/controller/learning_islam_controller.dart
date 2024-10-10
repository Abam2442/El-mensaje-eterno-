import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/learning_islam_entities.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/usecase/learning_islam_usecase.dart';

class LearningIslamControllerImp extends GetxController {
  List<LearningIslamEntities> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getArtical() async {
    LearningIslamUseCase learningIslamUseCase =
        LearningIslamUseCase(Get.find());
    var result = await learningIslamUseCase();
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
