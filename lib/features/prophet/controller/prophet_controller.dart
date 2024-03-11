import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/prophet/model/prophetModel.dart';

class ProphetController extends GetxController{

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    loadJsonFile();
    super.onInit();
  }
  late ProphetModel prophetModel;
  Future<void> loadJsonFile()async{
    String data = await  rootBundle.loadString('assets/json/Sp-biographyofprophet.json');
    prophetModel = ProphetModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}