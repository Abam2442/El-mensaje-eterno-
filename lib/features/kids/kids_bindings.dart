import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/kids/controller/kids_controller.dart';

class KidsBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(KidsController());
  }
}
