import 'dart:convert';

import 'package:flutter/services.dart';
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
    // print(file);
    list = (await readJsonFile(file))
        .map<IntermediateSalahModel>(IntermediateSalahModel.fromJson)
        .toList();
    print(list[0].rakaa);
    isLoading.value = false;
  }

  static Future<List<dynamic>> readJsonFile(String path) async {
    String data = await rootBundle.loadString(path);
    final body;
    try {
      body = await json.decode(data);
      print(body[0]);
    } catch (e) {
      print(e.toString());
      return [];
    }
    return body;
  }
}
