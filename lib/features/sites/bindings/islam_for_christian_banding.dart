import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/islam_for_chrictians_remote_data_source.dart';
import '../data/data_source/local_data_source/islam_for_christians_local_data_source.dart';
import '../data/repository/islam_for_christians_repo_impl.dart';
import '../domain/repository/islam_for_christians_repository.dart';
import '../presentation/controller/islam_for_christians_controller.dart';

class IslamForChristiansBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamForChristiansLocalDataSource>(
      IslamForChristiansLocalDataSourceImp(
          // sharedPreferencesService: Get.find(),
          ),
    );
    Get.put<IslamForChristiansRepository>(
      IslamForChristiansRepositoryImp(
          islamForChristiansLocalDataSource: Get.find(),
          Get.put(IslamForChrictiansRemoteDataSourceImpl())),
    );

    Get.put(IslamForChristiansControllerImp());
  }
}
