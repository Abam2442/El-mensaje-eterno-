import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/home_screen.dart';
import 'package:hiwayda_oracion_islamica/features/salah/model/tahara_lesson_model.dart';

class SplashPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    AppPublicVar.taharaLessons = await TaharaLessonFromJson.getData();
    goToNextView();
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.off(() => const HomeScreen());
      Get.delete<SplashPageController>();
    });
  }
}
