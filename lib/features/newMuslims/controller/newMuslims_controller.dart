import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/check_offline_files.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_offline_data.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_online_data.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/model/category_Sp_model.dart';
import '../model/NewMuslimsModel.dart';

class NewMuslimsController extends GetxController {
  static NewMuslimsController get instance => Get.find<NewMuslimsController>();
  RxBool isLoading = true.obs;
  RxBool isLoading1 = true.obs;
  @override
  void onInit() async {
    await checkOfflineFiles('Sp-newmuslimscourse.json')
        ? (loadJsonFile(), loadJsonFileCategory())
        : await getOnlineData0();

    super.onInit();
  }

  late NewMuslimsModel newMuslimsModel;
  List<CategorySpModel> categorySpModel = [];

  Future<void> getOnlineData0() async {
    try {
      final jsonString = await getOnlineData('Sp-newmuslimscourse.json');
      final jsonStringCategory =
          await getOnlineData('sp-newmuslim-category.json');
      jsonStringCategory['data'].forEach((v) {
        categorySpModel.add(CategorySpModel.fromJson(v));
      });
      newMuslimsModel = NewMuslimsModel.fromJson(jsonString);
      isLoading.value = false;
      isLoading1.value = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> loadJsonFile() async {
    final data = await getOfflineData('Sp-newmuslimscourse.json');
    newMuslimsModel = NewMuslimsModel.fromJson(data);
    isLoading.value = false;
  }

  Future<void> loadJsonFileCategory() async {
    final data = await getOfflineData('sp-newmuslim-category.json');
    data['data'].forEach((v) {
      categorySpModel.add(CategorySpModel.fromJson(v));
    });
    isLoading1.value = false;
  }
}
