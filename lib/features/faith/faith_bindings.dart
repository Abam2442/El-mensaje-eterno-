import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/faith/controller/faith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/data_source/faith_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/repository/faith_repo_impl.dart';

class FaithBindings extends Bindings {
  @override
  void dependencies() {
    // First register the data source
    Get.put<FaithLocalDataSource>(FaithLocalDataSourceImpl());
    
    // Then register the repository that depends on the data source
    Get.put<FaithRepoImpl>(FaithRepoImpl(Get.find<FaithLocalDataSource>()));
    
    // Finally register the controller that depends on the repository
    Get.put(FaithController());
  }
}
