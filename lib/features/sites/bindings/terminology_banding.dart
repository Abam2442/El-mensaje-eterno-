import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/terminology_repo.dart';
import '../data/data_source/local_data_source/terminology_local_data_source.dart';
import '../data/repository/terminology_repo_impl.dart';
import '../presentation/controller/terminology_controller.dart';

class TerminologyBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<TerminologyLocalDataSource>(
      TerminologyLocalDataSourceImp(),
    );
    Get.put<FixedCategoryRepository>(
      TerminologyRepositoryImp(
          terminologyLocalDataSource: Get.find(),),
    );

    Get.put(TerminologyControllerImp());
  }
}
