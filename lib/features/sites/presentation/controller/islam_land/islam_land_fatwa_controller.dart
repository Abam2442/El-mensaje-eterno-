import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/islam_land_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/usecase/islam_land_usecase.dart';

class IslamLandFatawaControllerImp extends GetxController {
  List<MediaEntity> onLineFatwa = [];
  List<IslamLandFatwaEntities> offLineFatwa = [];

  // States
  StateType getDataState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getOnlineFatwa() async {
    IslamLandUseCase islamLandUseCase = IslamLandUseCase(Get.find());
    var result = await islamLandUseCase.callOnlineFatwa();
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
        onLineFatwa = r;

        update();
      },
    );
  }

  Future<void> getOfflineFatwa() async {
    IslamLandUseCase islamLandUseCase = IslamLandUseCase(Get.find());
    var result = await islamLandUseCase.callOfflineFatwa();
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
        offLineFatwa = r;

        update();
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    await getOnlineFatwa();
    await getOfflineFatwa();
  }
}
