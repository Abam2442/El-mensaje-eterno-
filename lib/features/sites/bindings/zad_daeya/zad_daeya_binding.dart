import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/zad_daeia_local_datasource.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/repository/zad_daeya_repository_impl.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/zad_daeia_repo.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/zad_da3ia/zad_daiya_controller.dart';

class ZadDaeyaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ZadDaeiaLocalDatasource>(
      ZadDaeiaLocalDatasourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService: Get.find(),
      ),
    );
    Get.put<ZadDaeiaRepository>(
      ZadDaeyaRepositoryImpl(
        localDatasource: Get.find(),
      ),
    );

    Get.put(ZadDaeiaController());
  }
}
