import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/mohammad_messanger_local_data_source.dart';
import '../data/repository/mohammad_messanger_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/mohammad_controller.dart';

class MohammadMessangerBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<MohammadMessangerLocalDataSource>(
      MohammadMessangerLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      MohammadMessangerRepositoryImp(
        messangerLocalDataSource: Get.find(),
      ),
    );

    Get.put(MohammadMessangerControllerImp());
  }
}
