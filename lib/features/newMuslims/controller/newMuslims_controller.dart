import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../model/NewMuslimsModel.dart';

class NewMuslimsController extends GetxController{

  RxBool isLoading = true.obs;
  @override
  void onInit() {
    loadJsonFile();
    super.onInit();
  }
  late NewMuslimsModel newMuslimsModel;
  Future<void> loadJsonFile()async{
    String data = await  rootBundle.loadString('assets/json/Sp-newmuslimscourse.json');
    newMuslimsModel = NewMuslimsModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }
}