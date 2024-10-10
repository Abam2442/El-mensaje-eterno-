import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/usecase/islam_house_usecase.dart';

class IslamHouseFatwaControllerImp extends GetxController {
  List<FixedEntities> data = [];

  // States
  StateType getDataState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getContent() async {
    IslamHouseUseCase islamLandUseCase = IslamHouseUseCase(Get.find());
    var result = await islamLandUseCase.getFatwa();
    result.fold(
      (l) async {
        getDataState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getDataState = StateType.init;
      },
      (r) {
        getDataState = StateType.success;
        data = r;

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
