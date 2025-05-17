import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/data_source/salah_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/repository/salah_repo_impl.dart';
import 'package:hiwayda_oracion_islamica/features/salah/domain/repository/salah_repo.dart';
import 'package:hiwayda_oracion_islamica/features/salah/salah_controller.dart';

class SalahBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SalahLocalDataSource>(SalahLocalDataSourceImpl());
    Get.put<SalahRepo>(SalahRepoImpl(Get.find(), ));
    Get.put(SalahController());
  }
}
