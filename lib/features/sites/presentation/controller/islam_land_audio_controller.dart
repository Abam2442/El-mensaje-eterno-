import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/usecase/islam_land_usecase.dart';

class IslamLandAudioControllerImp extends GetxController {
  List<MediaEntity> data = [];

  // States
  StateType getDataState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getContent() async {
    IslamLandUseCase islamLandUseCase = IslamLandUseCase(Get.find());
    var result = await islamLandUseCase.callAudios();
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
