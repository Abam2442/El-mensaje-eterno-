import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/usecase/sites_usecase.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/fixed_entities.dart';

class SitesController extends GetxController {
  List<FixedEntities> articals = [];
  // States
  StateType getArticalsState = StateType.init;
  SitesController(String fileName, String sectionName) {
    getArtical(fileName, sectionName);
  }

  // Primitive
  String validationMessage = '';

  Future<void> getArtical(fileName, sectionName) async {
    SitesUsecase sitesUseCase = SitesUsecase(sitesRepository: Get.find());
    // FixedUseCase beginingUseCase = FixedUseCase(Get.find());
    var result = await sitesUseCase(fileName, sectionName);
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

  // @override
  // void onReady() {
  //   SitesBindings().dependencies();
  //   super.onReady();
  // }

  // @override
  // void onInit() {
  //   SitesBindings().dependencies();
  //   super.onInit();
  // }
}
