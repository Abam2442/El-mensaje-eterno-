import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/begining_local_data_source.dart';
import '../data/repository/begining_repo_imp.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/beginning_controller.dart';

class BeginingBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<BeginingLocalDataSource>(
      BeginingLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      BeginingRepositoryImp(
        beginingLocalDataSource: Get.find(),
      ),
    );

    Get.put(BeginingControllerImp());
  }
}
