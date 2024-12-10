import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_house/islam_house_videos_controller.dart';
import '../../data/data_source/local_data_source/islam_house_local_data_source.dart';
import '../../data/repository/islam_house_repo_impl.dart';
import '../../domain/repository/islam_house_repository.dart';

class IslamHouseVideosBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamHouseLocalDataSource>(
      IslamHouseLocalDataSourceImpl(
          //
          ),
    );
    Get.put<IslamHouseRepository>(
      IslamHouseRepositoryImp(
        islamHouseLocalDataSource: Get.find(),
      ),
    );

    Get.put(IslamHouseVideosControllerImp());
  }
}
