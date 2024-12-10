import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/rasuluallh_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/rasuluallh_repository_repository.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/rasuluallah/rasulullah_audios_controller.dart';
import '../../data/data_source/local_data_source/rasuluallah_local_data_source.dart';
import '../../data/repository/rasuluallh_repo_impl.dart';

class RasuluallhAudiosBindings extends Bindings {
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
        Get.put(
          RasuluallhRemoteDataSourceImpl(),
        ),
      ),
    );

    Get.put(RasuluallhAudiosControllerImp());
  }
}
