import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/newLife/model/newLifeModel.dart';

class NewLifeController extends GetxController{

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    loadJsonFile();
    super.onInit();
  }
  late NewLifeModel newLifeModel;
  Future<void> loadJsonFile()async{
    String data = await  rootBundle.loadString('assets/json/Sp-newlife.json');
    newLifeModel = NewLifeModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}