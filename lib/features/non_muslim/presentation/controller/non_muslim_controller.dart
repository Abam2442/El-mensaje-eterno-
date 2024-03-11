import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/domain/usecases/get_courses_use_case.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class NonMuslimController extends GetxController {
  // Data
  List<NonMuslimModel> hadithes = [];

  // States
  StateType getCoursesState = StateType.init;

  // Primitive
  String validationMessage = '';

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit NonMuslimController");
    super.onInit();
    await getCourses();
    Get.find<Logger>().w("End onInit NonMuslimController");
  }

  Future<void> getCourses() async {
    Get.find<Logger>().i("Start `getCourses` in |NonMuslimController|");
    getCoursesState = StateType.loading;
    update();
    GetCoursesUseCase getCoursesUseCase = GetCoursesUseCase(Get.find());
    var result = await getCoursesUseCase();
    result.fold(
      (l) async {
        getCoursesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getCoursesState = StateType.init;
      },
      (r) {
        getCoursesState = StateType.success;
        hadithes = r;
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getCourses` in |NonMuslimController| $getCoursesState");
  }
}
