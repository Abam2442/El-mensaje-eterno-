import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/islam_for_christians_local_data_source.dart';
import '../data/repository/islam_for_christians_repo_impl.dart';
import '../domain/repository/islam_for_christians_repository.dart';
import '../presentation/controller/islam_for_christians_controller.dart';

class IslamForChristiansBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamForChristiansLocalDataSource>(
      IslamForChristiansLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<IslamForChristiansRepository>(
      IslamForChristiansRepositoryImp(
        islamForChristiansLocalDataSource: Get.find(),
      ),
    );

    Get.put(IslamForChristiansControllerImp());
  }
}
