import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/fixed_category_repo.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/terminology_local_data_source.dart';
import '../data/repository/terminology_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/terminology_controller.dart';

class TerminologyBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<TerminologyLocalDataSource>(
      TerminologyLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedCategoryRepository>(
      TerminologyRepositoryImp(
        terminologyLocalDataSource: Get.find(),
      ),
    );

    Get.put(TerminologyControllerImp());
  }
}
