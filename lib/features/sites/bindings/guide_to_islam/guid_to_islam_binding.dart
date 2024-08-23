import 'package:get/get.dart';
import '../../../../core/services/archive_service.dart';
import '../../data/data_source/guide_to_islam_local_data_source.dart';
import '../../data/repository/guide_to_islam_repo_imp.dart';
import '../../domain/repository/guide_to_islam_repository.dart';
import '../../presentation/controller/guide_to_islam/guide_to_islam_controller.dart';

class GuideToIslamBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<GuideToIslamLocalDataSource>(
      GuideToIslamLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<GuideToIslamRepository>(
      GuideToIslamRepositoryImp(
        islamLocalDataSource: Get.find(),
      ),
    );

    Get.put(GuideToIslamControllerImp());
  }
}
