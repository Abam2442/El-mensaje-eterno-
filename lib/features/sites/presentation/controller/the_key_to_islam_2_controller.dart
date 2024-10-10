import 'package:get/get.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../data/models/the_key_to_islam_2_model.dart';
import '../../domain/usecase/the_key_to_islam_2_usecase.dart';

class TheKeyToIslam2ControllerImp extends GetxController {
  List<TheKeyToIslam2> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getArtical() async {
    TheKeyToIslam2UseCase theKeyToIslam2UseCase =
        TheKeyToIslam2UseCase(Get.find());
    var result = await theKeyToIslam2UseCase();
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
