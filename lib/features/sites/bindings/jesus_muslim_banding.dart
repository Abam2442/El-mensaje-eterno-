import 'package:get/get.dart';
import '../data/data_source/local_data_source/jesus_muslim_local_data_source.dart';
import '../data/repository/jesus_muslim_repo_impl.dart';
import '../domain/repository/jesus_muslim_repository.dart';
import '../presentation/controller/jesus_muslim_controller.dart';

class JesusMuslimBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<JesusMuslimLocalDataSource>(
      JesusMuslimLocalDataSourceImp(),
    );
    Get.put<JesusMuslimRepository>(
      JesusMuslimRepositoryImp(
        jesusMuslimLocalDataSource: Get.find(),
      ),
    );

    Get.put(JesusMuslimControllerImp());
  }
}
