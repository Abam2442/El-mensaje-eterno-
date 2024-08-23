import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/islam_religion_of_pace_local_data_source.dart';
import '../data/repository/islam_religion_of_pace_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/islam_religion_of_pace_controller.dart';

class IslamReligionOfPaceBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamReligionOfPaceLocalDataSource>(
      IslamReligionOfPaceLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      IslamReligionOfPaceRepositoryImp(
        islamReligionOfPaceLocalDataSource: Get.find(),
      ),
    );

    Get.put(IslamReligionOfPaceControllerImp());
  }
}
