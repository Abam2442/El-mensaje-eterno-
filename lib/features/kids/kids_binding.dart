
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'controller/kids_controller.dart';

class KidsBindings extends Bindings {
  @override
  dependencies() async {
//    Get.put<KidsController>(KidsController(), permanent: true);
  }
}