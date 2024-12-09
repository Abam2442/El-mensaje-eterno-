import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/repository/explore_islam_repo_impl.dart';
import '../data/data_source/local_data_source/explore_islam_local_data_source.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/explore_islam_controller.dart';

class ExploreIslamBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<ExploreIslamLocalDataSource>(
      ExploreIslamLocalDataSourceImp(),
    );
    Get.put<FixedRepository>(
      ExploreIslamRepositoryImp(
        exploreIslamLocalDataSource: Get.find(),
      ),
    );

    Get.put(ExploreIslamControllerImp());
  }
}
