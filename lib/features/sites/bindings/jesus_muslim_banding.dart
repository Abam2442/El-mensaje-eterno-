import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/jesus_muslim_local_data_source.dart';
import '../data/repository/jesus_muslim_repo_impl.dart';
import '../domain/repository/jesus_muslim_repository.dart';
import '../presentation/controller/jesus_muslim_controller.dart';

class JesusMuslimBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<JesusMuslimLocalDataSource>(
      JesusMuslimLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<JesusMuslimRepository>(
      JesusMuslimRepositoryImp(
        jesusMuslimLocalDataSource: Get.find(),
      ),
    );

    Get.put(JesusMuslimControllerImp());
  }
}
