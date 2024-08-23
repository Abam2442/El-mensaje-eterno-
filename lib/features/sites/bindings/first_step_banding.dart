import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/first_step_local_data_source.dart';
import '../data/repository/first_step_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/first_controller.dart';

class FirstStepBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<FirstStepLocalDataSource>(
      FirstStepLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      FirstStepRepositoryImp(
        firstStepLocalDataSource: Get.find(),
      ),
    );

    Get.put(FirstStepControllerImp());
  }
}
