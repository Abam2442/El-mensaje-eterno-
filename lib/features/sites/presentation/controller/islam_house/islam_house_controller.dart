import 'package:get/get.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../../domain/usecase/islam_house_usecase.dart';

class IslamHouseControllerImp extends GetxController {
  List<FixedEntities> content = [];

  // States
  StateType getArticalState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getContent() async {
    IslamHouseUseCase islamHouseUseCase = IslamHouseUseCase(Get.find());
    var result = await islamHouseUseCase.call();
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
        content = r;

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
