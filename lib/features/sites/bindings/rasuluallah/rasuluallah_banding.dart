import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/rasuluallh_repository_repository.dart';
import '../../data/data_source/local_data_source/rasuluallah_local_data_source.dart';
import '../../data/repository/rasuluallh_repo_impl.dart';
import '../../presentation/controller/rasuluallah/rasulullah_controller.dart';

class RasuluallhBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<RasuluallhLocalDataSource>(
      RasuluallhLocalDataSourceImp(
          //
          ),
    );
    Get.put<RasuluallhRepository>(
      RasuluallhRepositoryImp(
        rasuluallhLocalDataSource: Get.find(),
      ),
    );

    Get.put(RasuluallhControllerImp());
  }
}
