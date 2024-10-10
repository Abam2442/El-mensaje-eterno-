import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/newLife/controller/newLife_controller.dart';

class NewLifeBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(NewLifeController());
  }
}
