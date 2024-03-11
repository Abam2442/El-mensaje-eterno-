import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/islamic_centers_model.dart';

class IslamicCenterController extends GetxController{

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    loadJsonFile();
    super.onInit();
  }

  late IslamicCenterModel islamicCenterModel;
  Future<void> loadJsonFile()async{
    String data = await  rootBundle.loadString('assets/json/islamicCenters.json');
    islamicCenterModel = IslamicCenterModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}