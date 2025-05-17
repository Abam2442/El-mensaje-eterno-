import 'dart:convert';
import 'dart:developer';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
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
    log(file);
    list = ( await loadOfflineFile(file))
        .map<IntermediateSalahModel>(IntermediateSalahModel.fromJson)
        .toList();
    // print(list[0].rakaa);
    isLoading.value = false;
  }

  Future<List<dynamic>> loadOfflineFile(String path) async {
    try {
      final response =await getOfflineData(Get.arguments['file']);
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = await jsonDecode(jsonString);
      return finalData;
    } catch (e) {
      return [];
      // print(e);
    }
  }

  
}
