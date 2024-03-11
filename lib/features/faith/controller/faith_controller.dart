import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/faith/model/faithModel.dart';

class FaithController extends GetxController{

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    loadJsonFile();
    super.onInit();
  }
  late FaithModel faithModel;
  Future<void> loadJsonFile()async{
    String data = await  rootBundle.loadString('assets/json/Sp-faith.json');
    faithModel = FaithModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}