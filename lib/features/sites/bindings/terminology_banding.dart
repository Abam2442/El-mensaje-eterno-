import 'package:get/get.dart';
import '../data/data_source/local_data_source/terminology_local_data_source.dart';
import '../data/repository/terminology_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/terminology_controller.dart';

class TerminologyBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<TerminologyLocalDataSource>(
      TerminologyLocalDataSourceImp(),
    );
    Get.put<FixedRepository>(
      TerminologyRepositoryImp(
        terminologyLocalDataSource: Get.find(),
      ),
    );

    Get.put(TerminologyControllerImp());
  }
}
