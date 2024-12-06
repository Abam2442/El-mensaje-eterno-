import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/islam_land_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_land/islam_land_fatwa_controller.dart';
import '../../data/data_source/local_data_source/islam_land_local_data_source.dart';
import '../../data/repository/islam_land_repo_impl.dart';
import '../../domain/repository/islam_land_repository.dart';

class IslamLandFatwaBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamLandLocalDataSource>(
      IslamLandLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
      ),
    );
    Get.put<IslamLandRepository>(
      IslamLandRepositoryImp(
        islamLandLocalDataSource: Get.find(),
        Get.put(
          IslamLandRemoteDataSourceImpl(),
        ),
      ),
    );

    Get.put(IslamLandFatawaControllerImp());
  }
}
