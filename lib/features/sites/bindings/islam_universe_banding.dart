import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/islam_universe_local_data_source.dart';
import '../data/repository/islam_universe_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/islam_universe_controller.dart';

class IslamUniverseBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamUniverseLocalDataSource>(
      IslamUniverseLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      IslamUniverseRepositoryImp(
        islamUniverseLocalDataSource: Get.find(),
      ),
    );

    Get.put(IslamUniverseControllerImp());
  }
}
