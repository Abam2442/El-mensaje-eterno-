import 'package:get/get.dart';
import '../../../../core/services/archive_service.dart';
import '../../data/data_source/islam_land_local_data_source.dart';
import '../../data/repository/islam_land_repo_impl.dart';
import '../../domain/repository/islam_land_repository.dart';
import '../../presentation/controller/islam_land/islam_land_controller.dart';

class IslamLandBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamLandLocalDataSource>(
      IslamLandLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<IslamLandRepository>(
      IslamLandRepositoryImp(
        islamLandLocalDataSource: Get.find(),
      ),
    );

    Get.put(IslamLandControllerImp());
  }
}
