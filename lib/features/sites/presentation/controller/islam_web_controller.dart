import 'package:get/get.dart';

import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/islam_web_entities.dart';
import '../../domain/usecase/islam_web_usecase.dart';

class IslamWebControllerImp extends GetxController {
  List<IslamWebEntities> data = [];
  List<IslamWebEntities> currentPageData = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  int pageIndex = 0;

  Future<void> getArtical() async {
    IslamWebUseCase islamWebUseCase = IslamWebUseCase(Get.find());
    var result = await islamWebUseCase();
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
        data = r;
        currentPageData = data.take(20).toList();
        update();
      },
    );
  }

  onPageChanged(int page) {
    pageIndex = page;
    currentPageData.clear();
    currentPageData = data.getRange(page * 20, (page * 20) + 20).toList();
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await getArtical();
  }
}
