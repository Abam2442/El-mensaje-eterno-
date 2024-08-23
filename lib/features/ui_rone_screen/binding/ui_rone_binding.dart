import 'package:get/get.dart';
import '../controller/ui_rone_controller.dart';

/// A binding class for the UiRoneScreen.
///
/// This class ensures that the UiRoneController is created when the
/// UiRoneScreen is first loaded.
class UiRoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UiRoneController());
  }
}
