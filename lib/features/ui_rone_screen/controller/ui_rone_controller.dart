import 'dart:convert';
import 'dart:developer';

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
  void onInit() async {
    await loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    file = Get.arguments['file'];
    for (var val in (await readJsonFile(file))) {
      try {
        final IntermediateSalahModel data =
            IntermediateSalahModel.fromJson(val);
        print(data);
        list.add(data);
      } catch (e) {
        print('error ================');
        log(val);
      }
    }

    print(list[0].images?.description);
    // final data = ;
    // list.add(data);
    // list = (await readJsonFile(file))
    //     .map<IntermediateSalahModel>(IntermediateSalahModel.fromJson)
    //     .toList();
    isLoading.value = false;
  }

  static Future<List<dynamic>> readJsonFile(String path) async {
    String data = await rootBundle.loadString(path);
    final body;
    try {
      body = await json.decode(data);
      print(body);

      print(' suuuuuuu=========================');
    } catch (e) {
      print('alied=====================');
      return [];
    }
    return body;
  }
}
