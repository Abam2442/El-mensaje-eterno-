import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/bidaa_in_islam_local_data_source.dart';
import '../data/repository/bidaa_in_islam_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/bidaa_controller.dart';

class BidaaInIslamBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<BidaaInIslamLocalDataSource>(
      BidaaInIslamLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      BidaaInIslamRepositoryImp(
        bidaaInIslamLocalDataSource: Get.find(),
      ),
    );

    Get.put(BidaaInIslamControllerImp());
  }
}
