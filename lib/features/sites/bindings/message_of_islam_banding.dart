import 'package:get/get.dart';
import '../../../core/services/archive_service.dart';
import '../data/data_source/message_of_islam_local_data_source.dart';
import '../data/repository/message_of_islam_repo_impl.dart';
import '../domain/repository/fixed_repository.dart';
import '../presentation/controller/massage_controller.dart';

class MessageOfIslamBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<MessageOfIslamLocalDataSource>(
      MessageOfIslamLocalDataSourceImp(
        sharedPreferencesService: Get.find(),
        archiveService:
            Get.put(ArchiveService(sharedPreferencesService: Get.find())),
      ),
    );
    Get.put<FixedRepository>(
      MessageOfIslamRepositoryImp(
        messageOfIslamLocalDataSource: Get.find(),
      ),
    );

    Get.put(MessageOfIslamControllerImp());
  }
}
