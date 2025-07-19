import 'dart:convert';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:get/get.dart';
import '../model/islamic_centers_model.dart';

class IslamicCenterController extends GetxController {
  RxBool isLoading = true.obs;
  @override
  void onInit() async {
    await   loadofflineFile();
    super.onInit();
  }

  Future<void> loadofflineFile() async {
    try {
      final response = await getAssetsData('islamicCenters.json');
      islamicCenterModel = IslamicCenterModel.fromJson(response);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  late IslamicCenterModel islamicCenterModel;

}
