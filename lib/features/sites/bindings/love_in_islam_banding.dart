import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/love_in_islam_local_data_source.dart';
import '../data/repository/love_in_islam_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/love_controller.dart';

class LoveInIslamBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<LoveInIslamLocalDataSource>(
      LoveInIslamLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      LoveInIslamRepositoryImp(
        loveInIslamLocalDataSource: Get.find(),
      ),
    );

    Get.put(LoveInIslamControllerImp());
  }
}
