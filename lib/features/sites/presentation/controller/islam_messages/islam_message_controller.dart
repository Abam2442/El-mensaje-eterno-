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
