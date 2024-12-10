import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/islam_web_remote_data_source.dart';
import '../data/data_source/local_data_source/islam_web_local_data_source.dart';
import '../data/repository/islam_web_repo_impl.dart';
import '../domain/repository/islam_web_repository.dart';
import '../presentation/controller/islam_web_controller.dart';

class IslamWebBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamWebLocalDataSource>(
      IslamWebLocalDataSourceImpl(),
    );
    Get.put<IslamWebRepository>(
      IslamWebRepositoryImp(
          islamWebLocalDataSource: Get.find(),
          Get.put(IslamWebRemoteDataSourceImpl())),
    );

    Get.put(IslamWebControllerImp());
  }
}
