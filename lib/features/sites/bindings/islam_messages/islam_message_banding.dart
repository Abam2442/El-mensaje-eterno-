import 'package:get/get.dart';
import '../../data/data_source/local_data_source/islam_message_local_data_source.dart';
import '../../data/repository/islam_messag_repo_impl.dart';
import '../../domain/repository/islam_message_repository.dart';
import '../../presentation/controller/islam_messages/islam_message_controller.dart';

class IslamMessageBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamMessageLocalDataSource>(
      IslamMessageLocalDataSourceImpl(),
    );
    Get.put<IslamMessageRepository>(
      IslamMessageRepositoryImp(
          islamMessageLocalDataSource: Get.find(),),
    );

    Get.put(IslamMessageControllerImp());
  }
}
