// import 'package:elresala/features/sites/domain/repository/islam_qa_repository.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/data_source/remote_data_source/islam_qa_remote_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/repository/islam_qa_repository.dart';
import '../data/data_source/local_data_source/islam_qa_local_datasorce.dart';
import '../data/repository/islam_qa_repo_imp.dart';
import '../presentation/controller/islam_qa_controller.dart';

class IslamQABindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamqaLocalDataSource>(
      IslamQALocalDataSourceImpl(),
    );
    Get.put<IslamQARepository>(
      IslamQARepositoryImp(
          islamQALocalDataSource: Get.find(),
          Get.put(IslamQaRemoteDataSourceImpl())),
    );

    Get.put(IslamQAControllerImp());
  }
}
