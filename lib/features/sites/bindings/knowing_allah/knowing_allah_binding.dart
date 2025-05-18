import 'package:get/get.dart';
import '../../data/data_source/local_data_source/knowing_allah_local_data_source.dart';
import '../../data/repository/knowing-allah_repo_imp.dart';
import '../../domain/repository/knowing_allah_repository.dart';
import '../../presentation/controller/knowing_allah/knowing_allah_controller.dart';

class KnowingAllahBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<KnowingAllahLocalDataSource>(
      KnowingAllahLocalDataSourceImp(),
    );
    Get.put<KnowingAllahRepository>(
      KnowingAllahRepositoryImp(
          knowingAllahLocalDataSource: Get.find(),),
    );

    Get.put(KnowingAllahControllerImp());
  }
}
