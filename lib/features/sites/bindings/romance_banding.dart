import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/romance_local_data_source.dart';
import '../data/repository/romance_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/romace_controller.dart';

class RomanceBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<RomanceLocalDataSource>(
      RomanceLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      RomanceRepositoryImp(
        romanceLocalDataSource: Get.find(),
      ),
    );

    Get.put(RomanceControllerImp());
  }
}
