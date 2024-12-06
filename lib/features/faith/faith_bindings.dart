import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/faith/controller/faith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/data_source/faith_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/data_source/faith_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/faith/data/repository/faith_repo_impl.dart';
import 'package:hiwayda_oracion_islamica/features/faith/domain/repository/faith_repo.dart';

class FaithBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<FaithLocalDataSource>(FaithLocalDataSourceImpl());
    Get.put<FaithRemoteDataSource>(FaithRemoteDataSourceImpl());

    Get.put<FaithRepo>(
      FaithRepoImpl(
        Get.find<FaithLocalDataSource>(),
        Get.find<FaithRemoteDataSource>(),
      ),
    );
    Get.put(FaithController());
  }
}
