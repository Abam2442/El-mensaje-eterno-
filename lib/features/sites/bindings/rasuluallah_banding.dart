import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/rasuluallah_local_data_source.dart';
import '../data/repository/rasuluallh_repo_impl.dart';
import '../domain/repository/islam_religion_repository.dart';
import '../presentation/controller/rasulullah_controller.dart';

class RasuluallhBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<RasuluallhLocalDataSource>(
      RasuluallhLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<IslamReligionRepository>(
      RasuluallhRepositoryImp(
        rasuluallhLocalDataSource: Get.find(),
      ),
    );

    Get.put(RasuluallhControllerImp());
  }
}
