import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/women_local_data_source.dart';
import '../data/repository/women_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/woman_controller.dart';

class WomenBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<WomenLocalDataSource>(
      WomenLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      WomanRepositoryImp(
        womenLocalDataSource: Get.find(),
      ),
    );

    Get.put(WomanControllerImp());
  }
}
