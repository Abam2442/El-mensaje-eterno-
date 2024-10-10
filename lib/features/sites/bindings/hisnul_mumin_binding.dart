import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/hisnul_mumin_repository.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/hisnul_mumin_local_data_source.dart';
import '../data/repository/hisnul_mumin_repo_imp.dart';
import '../presentation/controller/hisnul_mumin_controller.dart';

class HisnulMuminBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<HisnulMuminLocalDataSource>(
      HisnulMuminLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<HisnulMuminRepository>(
      HisnulMuminRepositoryImp(
        hisnulMuminLocalDataSource: Get.find(),
      ),
    );

    Get.put(HisnulMuminControllerImp());
  }
}
