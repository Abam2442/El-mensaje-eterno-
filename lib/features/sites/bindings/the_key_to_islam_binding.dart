import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/the_key_to_islam_local_date_source.dart';
import '../data/repository/the_key_to_islam_repo_imp.dart';
import '../domain/repository/the_key_to_islam_repo.dart';
import '../presentation/controller/the_key_to_islam_controller.dart';

class TheKeyToIslamBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<TheKeyToIslamLocalDataSource>(
      TheKeyToIslamLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<TheKeyToIslamRepo>(
      TheKeyToIslamRepositoryImp(
        theKeyToIslamLocalDataSource: Get.find(),
      ),
    );

    Get.put(TheKeyToIslamControllerImp());
  }
}
