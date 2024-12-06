import 'package:get/get.dart';

import '../data/data_source/local_data_source/saber_el_islam_local_data_source.dart';
import '../data/repository/saber_el_islam_repo_imp.dart';
import '../domain/repository/saber_el_islam_repository.dart';
import '../presentation/controller/saber_el_islam_controller.dart';

class SaberElIslamBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<SaberElIslamLocalDataSource>(
      SaberElIslamLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
      ),
    );
    Get.put<SaberElIslamRepository>(
      SaberElIslamRepositoryImp(
        saberElIslamLocalDataSource: Get.find(),
      ),
    );

    Get.put(SaberElIslamControllerImp());
  }
}
