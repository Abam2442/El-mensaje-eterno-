import 'package:get/get.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/usecase/islam_land_usecase.dart';

class IslamLandBooksControllerImp extends GetxController {
  Map<String, List<FixedEntities>> data = {};

  // States
  StateType getDataState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getContent() async {
    IslamLandUseCase islamLandUseCase = IslamLandUseCase(Get.find());
    var result = await islamLandUseCase.callBooks();
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
