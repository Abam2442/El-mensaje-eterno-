import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/prophet/controller/prophet_controller.dart';

class ProphetBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(ProphetController());
  }
}
