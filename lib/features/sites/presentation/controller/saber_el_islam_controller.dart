import 'package:get/get.dart';
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
