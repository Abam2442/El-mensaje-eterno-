import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/learning_islam_local_data_source.dart';
import '../data/repository/learning_islam_repo_imp.dart';
import '../domain/repository/learning_islam_repository.dart';
import '../presentation/controller/learning_islam_controller.dart';

class LearningIslamBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<LearningIslamLocalDataSource>(
      LearningIslamLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<LearningIslamRepository>(
      LearningIslamRepositoryImp(
        learningIslamLocalDataSource: Get.find(),
      ),
    );

    Get.put(LearningIslamControllerImp());
  }
}
