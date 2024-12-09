import 'package:get/get.dart';
import '../data/data_source/local_data_source/the_key_to_islam_2_local_datasource.dart';
import '../data/repository/the_key_to_islam_2_repo.dart';
import '../domain/repository/the_key_to_islam_2_repo.dart';
import '../presentation/controller/the_key_to_islam_2_controller.dart';

class TheKeyToIslam2Bindings extends Bindings {
  @override
  dependencies() async {
    Get.put<TheKeyToIslam2LocalDataSource>(
      TheKeyToIslam2LocalDataSourceImp(),
    );
    Get.put<TheKeyToIslam2Repo>(
      TheKeyToIslam2RepositoryImp(
        theKeyToIslam2LocalDataSource: Get.find(),
      ),
    );

    Get.put(TheKeyToIslam2ControllerImp());
  }
}
