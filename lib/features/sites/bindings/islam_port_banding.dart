import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/islam_port_local_data_source.dart';
import '../data/repository/islam_port_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/islam_port_controller.dart';

class IslamPortBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamPortLocalDataSource>(
      IslamPortLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      IslamPortRepositoryImp(
        islamPortLocalDataSource: Get.find(),
      ),
    );

    Get.put(IslamPortControllerImp());
  }
}
