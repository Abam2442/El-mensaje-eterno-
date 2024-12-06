import 'dart:convert';
import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:path_provider/path_provider.dart';

import '../model/islamic_centers_model.dart';

class IslamicCenterController extends GetxController {
  RxBool isLoading = true.obs;
  @override
  void onInit() async {
    await checkOfflineFiles('islamicCenters.json')
        ? await loadJsonFile()
        : await loadOnlineFile();
    super.onInit();
  }

  Future<void> loadOnlineFile() async {
    try {
      print('remote data');
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}islamicCenters.json'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = await jsonDecode(jsonString);
      islamicCenterModel = IslamicCenterModel.fromJson(finalData);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  late IslamicCenterModel islamicCenterModel;
  Future<void> loadJsonFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/islamicCenters.json';
    final file = File(filePath);
    String jsonString = await file.readAsString();
    final jsonResponse = await json.decode(jsonString);
    islamicCenterModel = IslamicCenterModel.fromJson(jsonResponse);
    isLoading.value = false;
  }
}
