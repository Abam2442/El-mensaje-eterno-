import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/get_assets_data.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/model/category_Sp_model.dart';
import '../model/NewMuslimsModel.dart';

class NewMuslimsController extends GetxController {
  static NewMuslimsController get instance => Get.find<NewMuslimsController>();
  RxBool isLoading = true.obs;
  RxBool isLoading1 = true.obs;
  @override
  void onInit() async {
    await  getOfflineData0();

    super.onInit();
  }

  late NewMuslimsModel newMuslimsModel;
  List<CategorySpModel> categorySpModel = [];

  Future<void> getOfflineData0() async {
    try {
      final jsonString = await getAssetsData('Sp-newmuslimscourse.json');
      final jsonStringCategory =
          await getAssetsData('sp-newmuslim-category.json');
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

}
