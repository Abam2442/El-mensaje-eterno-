import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/ui_rone_screen/models/IntermediateSalahModel.dart';

/// A controller class for the UiRoneScreen.
///
/// This class manages the state of the UiRoneScreen, including the
/// current uiRoneModelObj
class UiRoneController extends GetxController {
  RxBool isLoading = true.obs;
  List<IntermediateSalahModel> list = [];
  RxInt currentPos = 1.obs;
  String file = '';
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    file = Get.arguments['file'];
    list = (await loadOfflineFile(file))
        .map<IntermediateSalahModel>(IntermediateSalahModel.fromJson)
        .toList();
    // print(list[0].rakaa);
    isLoading.value = false;
  }

  Future<List<dynamic>> loadOfflineFile(String path) async {
    try {
      final response = await getAssetsData(path);
      return response as List<dynamic>;
    } catch (e) {
      return [];
      // print(e);
    }
  }
}
