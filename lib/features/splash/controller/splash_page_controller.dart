import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/hadith_bindings.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/navigation_screen/navigation_screen.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/controller/newMuslims_controller.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/non_muslim_bindings.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/controller/non_muslim_controller.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    // loadData();
    NonMuslimBindings().dependencies();
    Get.put(NonMuslimController());

    HadithBindings().dependencies();
    Get.put(HadithController());

    Get.put(NewMuslimsController());

    goToNextView();
    super.onInit();
  }

  // void loadData() async {
  //   AppPublicVar.taharaLessons = await TaharaLessonFromJson.getData();
  //   goToNextView();
  // }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const NavigationScreen());
      Get.delete<SplashPageController>();
    });
  }
}
