import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/controller/mooamalat_controller.dart';

class MooamalatBindings extends Bindings {
  @override
  dependencies() async {
    Get.put(MooamalatController());
  }
}
