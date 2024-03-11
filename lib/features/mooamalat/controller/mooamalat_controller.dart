import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/model/mooamalatModel.dart';

class MooamalatController extends GetxController{

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    loadJsonFile();
    super.onInit();
  }
  late MooamalatModel mooamalatModel;
  Future<void> loadJsonFile()async{
    String data = await  rootBundle.loadString('assets/json/Sp-moomlat.json');
    mooamalatModel = MooamalatModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}