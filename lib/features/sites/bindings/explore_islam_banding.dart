import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/explore_islam_local_data_source.dart';
import '../data/repository/explore_islam_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/explore_islam_controller.dart';

class ExploreIslamBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<ExploreIslamLocalDataSource>(
      ExploreIslamLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      ExploreIslamRepositoryImp(
        exploreIslamLocalDataSource: Get.find(),
      ),
    );

    Get.put(ExploreIslamControllerImp());
  }
}
