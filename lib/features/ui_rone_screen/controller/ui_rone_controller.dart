import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/features/ui_rone_screen/models/IntermediateSalahModel.dart';
import 'package:path_provider/path_provider.dart';

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
    list = (await checkOfflineFiles(file)
            ? await readJsonFile(file)
            : await loadOnlineFile(file))
        .map<IntermediateSalahModel>(IntermediateSalahModel.fromJson)
        .toList();
    // print(list[0].rakaa);
    isLoading.value = false;
  }

  Future<List<dynamic>> loadOnlineFile(String path) async {
    try {
      print('remote data');
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}${Get.arguments['file']}'));
      final jsonString = utf8.decode(response.bodyBytes);
      final finalData = await jsonDecode(jsonString);
      return finalData;
    } catch (e) {
      return [];
      // print(e);
    }
  }

  static Future<List<dynamic>> readJsonFile(String path) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$path';
    final file = File(filePath);
    String jsonString = await file.readAsString();
    final jsonResponse = json.decode(jsonString);
    return jsonResponse;
  }
}
