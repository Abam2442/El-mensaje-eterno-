import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/usecase/rasuluallah_usecase.dart';

import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';

class RasuluallhControllerImp extends GetxController {
  List<CategoryFixedEntity> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  List searchResult = [];

  void searchArticle(String val, target) {
    searchResult.clear();
    for (var item in target) {
      if (item.category.toLowerCase().contains(val.toLowerCase())) {
        searchResult.add(item);
      }
    }
    print(searchResult);
  }

  void searchSubArticle(String val, target) {
    searchResult.clear();
    for (var item in target) {
      if (item.name.toLowerCase().contains(val.toLowerCase())) {
        searchResult.add(item);
      }
    }
    print(searchResult);
  }

  Future<void> getArtical() async {
    RasuluallahUseCase rasulullahUseCase = RasuluallahUseCase(Get.find());
    var result = await rasulullahUseCase.call();
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
