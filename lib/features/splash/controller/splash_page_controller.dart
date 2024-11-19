import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/controller/advanced_learning_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/hadith_bindings.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';
import 'package:hiwayda_oracion_islamica/features/navigation_screen/navigation_screen.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/non_muslim_bindings.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/controller/non_muslim_controller.dart';
import 'package:hiwayda_oracion_islamica/features/salah/model/tahara_lesson_model.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    loadData();
    // NonMuslimBindings().dependencies();
    Get.put(HomeController());

    Get.put(AdvancedLearningController());

    NonMuslimBindings().dependencies();
    Get.put(NonMuslimController());

    HadithBindings().dependencies();
    Get.put(HadithController());
    // Get.put(TestController());

    goToNextView();
    super.onInit();
  }

  void loadData() async {
    AppPublicVar.taharaLessons = await TaharaLessonFromJson.getData();
    goToNextView();
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const NavigationScreen());
      Get.delete<SplashPageController>();
    });
  }
}
