import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/sites_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/repository/sites_repo_impl.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/sites_repository.dart';

class SitesBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<SitesRepository>(
      SitesRepoImp(dataSourceImpl: Get.put(SitesRemoteDataSourceImpl())),
    );
  }
}
