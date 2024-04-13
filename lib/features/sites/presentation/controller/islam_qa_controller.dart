// import 'package:elresala/features/sites/data/models/islam_qa.dart';
// import 'package:elresala/features/sites/domain/usecase/islam_qa_usecase.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../data/models/islam_qa.dart';
import '../../domain/usecase/islam_qa_usecase.dart';
// import '../../domain/usecase/the_key_to_islam_2_usecase.dart';

class IslamQAControllerImp extends GetxController {
  List<Islamqa> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getArtical() async {
    await Future.delayed(const Duration(milliseconds: 200));
    IslamQAUseCase islamQAUseCase = IslamQAUseCase(Get.find());
    var result = await islamQAUseCase();
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
