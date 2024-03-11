import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/PilersModel.dart';

class PilersController extends GetxController{

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    loadJsonFile();
    super.onInit();
  }
  late PilersModel pilersModel;
  Future<void> loadJsonFile()async{
    String data = await  rootBundle.loadString('assets/json/Sp-pillers.json');
    pilersModel = PilersModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}