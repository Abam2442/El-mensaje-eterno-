import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/jesus_in_quran/search/jesus_quran_search.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/usecase/fixed_usecase.dart';

class JesusQuranControllerImp extends GetxController {
  List<FixedEntities> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  GlobalKey<FormState> formState = GlobalKey();

  List searchResult = [];

  void searchArticle(String val, target) {
    if (formState.currentState!.validate()) {
      searchResult.clear();
      for (var item in target) {
        if (item.name.toLowerCase().contains(val.toLowerCase())) {
          searchResult.add(item);
        }
      }
      Get.to(() => const JesusQuranSearch());
    }
  }

  Future<void> getArtical() async {
    FixedUseCase jesusQuranUseCase = FixedUseCase(Get.find());
    var result = await jesusQuranUseCase();
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
