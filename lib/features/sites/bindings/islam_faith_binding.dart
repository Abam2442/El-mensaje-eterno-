import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/islam_faith_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/repository/islam_faith_repo_imp.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/islam_faith_repository.dart';
import '../../../core/services/archive_service.dart';
import '../presentation/controller/islam_faith_controller.dart';

class IslamFaithBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamFaithLocalDataSource>(
      IslamFaithLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );

    Get.put<IslamFaithRepository>(
      IslamFaithRepositoryImp(
        islamFaithLocalDataSource: Get.find(),
      ),
    );

    Get.put(IslamFaithControllerImp());
  }
}
