import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/faith/controller/faith_controller.dart';

class FaithBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(FaithController());
  }
}
