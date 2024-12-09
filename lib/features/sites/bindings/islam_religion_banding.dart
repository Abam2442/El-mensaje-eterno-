import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/islam_religion_remote_data_source.dart';
import '../data/data_source/local_data_source/islam_religion_local_data_source.dart';
import '../data/repository/islam_religion_repo_impl.dart';
import '../domain/repository/islam_religion_repository.dart';
import '../presentation/controller/islam_religion_controller.dart';

class IslamReligionBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamReligionLocalDataSource>(
      IslamReligionLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
      ),
    );
    Get.put<IslamReligionRepository>(
      IslamReligionRepositoryImp(
          islamReligionLocalDataSource: Get.find(),
          Get.put(IslamReligionRemoteDataSourceImpl())),
    );

    Get.put(IslamReligionControllerImp());
  }
}
