import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_api_routes.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/model/category_Sp_model.dart';
import '../model/NewMuslimsModel.dart';
import 'package:http/http.dart' as http;

class NewMuslimsController extends GetxController {
  static NewMuslimsController get instance => Get.find<NewMuslimsController>();
  RxBool isLoading = true.obs;
  RxBool isLoading1 = true.obs;
  @override
  void onInit() async {
    await checkOfflineFiles('Sp-newmuslimscourse.json')
        ? (loadJsonFile(), loadJsonFileCategory())
        : await getOnlineData();

    super.onInit();
  }

  late NewMuslimsModel newMuslimsModel;
  List<CategorySpModel> categorySpModel = [];

  Future<void> getOnlineData() async {
    try {
      final response = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}Sp-newmuslimscourse.json'));

      final responseCategory = await http
          .get(Uri.parse('${AppApiRoutes.jsonApi}sp-newmuslim-category.json'));
      final jsonString = jsonDecode(utf8.decode(response.bodyBytes));
      final jsonStringCategory =
          jsonDecode(utf8.decode(responseCategory.bodyBytes));
      jsonStringCategory['data'].forEach((v) {
        categorySpModel.add(CategorySpModel.fromJson(v));
      });
      newMuslimsModel = NewMuslimsModel.fromJson(jsonString);
      isLoading.value = false;
      update();
      print(newMuslimsModel);
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadJsonFile() async {
    String data =
        await rootBundle.loadString('assets/json/Sp-newmuslimscourse.json');
    // print(data);
    newMuslimsModel = NewMuslimsModel.fromJson(await json.decode(data));
    isLoading.value = false;
  }

  Future<void> loadJsonFileCategory() async {
    String data =
        await rootBundle.loadString('assets/json/sp-newmuslim-category.json');
    var jsondata = jsonDecode(data);
    jsondata['data'].forEach((v) {
      categorySpModel.add(CategorySpModel.fromJson(v));
    });
    isLoading1.value = false;
  }
}
