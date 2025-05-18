import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_messages/islam_message_books_controller.dart';
import '../../data/data_source/local_data_source/islam_message_local_data_source.dart';
import '../../data/repository/islam_messag_repo_impl.dart';
import '../../domain/repository/islam_message_repository.dart';

class IslamMessageBooksBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamMessageLocalDataSource>(
      IslamMessageLocalDataSourceImpl(),
    );
    Get.put<IslamMessageRepository>(
      IslamMessageRepositoryImp(
          islamMessageLocalDataSource: Get.find(),),
    );

    Get.put(IslamMessageBooksControllerImp());
  }
}
