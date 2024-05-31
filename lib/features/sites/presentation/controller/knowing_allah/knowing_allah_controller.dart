// import 'package:elresala/features/sites/data/models/islam_qa.dart';
// import 'package:elresala/features/sites/domain/usecase/islam_qa_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/knowing_allah_model.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/usecase/knowing_allah_usecase.dart';
// import '../../domain/usecase/the_key_to_islam_2_usecase.dart';

class KnowingAllahControllerImp extends GetxController {
  List<KnowingAllahSubCategoryModel> articals = [];
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
    }
  }

  Future<void> getArtical() async {
    await Future.delayed(const Duration(milliseconds: 200));
    KnowingAllahUseCase knowingAllahUseCase = KnowingAllahUseCase(Get.find());
    var result = await knowingAllahUseCase();
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
