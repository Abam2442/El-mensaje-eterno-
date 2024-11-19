import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';

class MainBindings extends Bindings {
  @override
  dependencies() async {
    // Get.put<MainRemoteDataSource>(
    //   MainRemoteDataSourceImpl(apiService: Get.find()),
    // );
    // Get.put<MainLocalDataSource>(
    //   MainLocalDataSourceImpl(pref: Get.find()),
    // );
    // Get.put<MainRepo>(
    //   MainRepoImpl(
    //     mainRemoteDataSource: Get.find(),
    //     mainLocalDataSource: Get.find(),
    //   ),
    // );
    //
    // Get.put(MainController());

    Get.put(
      ArchiveService(sharedPreferencesService: Get.find()),
    );
  }
}
