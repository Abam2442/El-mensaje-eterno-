// ignore_for_file: camel_case_types

import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/controller/advanced_learning_controller.dart';
import 'package:get/get.dart';


class Advanced_LearningBindings extends Bindings {
  @override
  dependencies() async {
    //

    Get.put(Advanced_LearningController());
  }
}
