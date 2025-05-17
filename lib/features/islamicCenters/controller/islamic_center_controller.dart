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
      print('remote data');
      final response = await getAssetsData('islamicCenters.json');
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = await jsonDecode(jsonString);
      islamicCenterModel = IslamicCenterModel.fromJson(finalData);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  late IslamicCenterModel islamicCenterModel;

}
