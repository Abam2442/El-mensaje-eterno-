import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/pilers/controller/pilers_controller.dart';

class PilersBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(PilersController());
  }
}
