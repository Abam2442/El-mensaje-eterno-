import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/human_rights_local_data_source.dart';
import '../data/repository/human_rights_repo_imp.dart';
import '../domain/repository/human_rights_repository.dart';
import '../presentation/controller/human_rights_controller.dart';

class HumanRightsBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<HumanRightsLocalDataSource>(
      HumanRightsLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<HumanRightsRepository>(
      HumanRightsRepositoryImp(
        humanRightsLocalDataSource: Get.find(),
      ),
    );

    Get.put(HumanRightsControllerImp());
  }
}
