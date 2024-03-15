import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/about/controller/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  dependencies() async {
    Get.put(AboutController());
  }
}
