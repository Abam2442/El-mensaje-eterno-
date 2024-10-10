import 'package:get/get.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../data/models/the_key_to_islam_model.dart';
import '../../domain/usecase/the_key_to_islam_usecase.dart';

class TheKeyToIslamControllerImp extends GetxController {
  List<TheKeyToIslamfirst> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getArtical() async {
    TheKeyToIslamUseCase theKeyToIslamUseCase =
        TheKeyToIslamUseCase(Get.find());
    var result = await theKeyToIslamUseCase();
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
