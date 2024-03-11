import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/jesus_quran_local_data_source.dart';
import '../data/repository/jesus_quran_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/jesus_quran_controller.dart';

class JesusQuranBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<JesusQuranLocalDataSource>(
      JesusQuranLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      JesusQuranRepositoryImp(
        jesusQuranLocalDataSource: Get.find(),
      ),
    );

    Get.put(JesusQuranControllerImp());
  }
}
