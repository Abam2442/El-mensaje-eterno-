import 'package:get/get.dart';
import '../data/data_source/local_data_source/islam_guide_1_local_data_source.dart';
import '../data/repository/islam_guide_1_repo_imp.dart';
import '../domain/repository/islam_guide_1_repository.dart';
import '../presentation/controller/islam_guide_1_controller.dart';

class IslamGuide1Bindings extends Bindings {
  @override
  dependencies() async {
    Get.put<IslamGuide1LocalDataSource>(
      IslamGuide1LocalDataSourceImpl(
          //
          ),
    );
    Get.put<IslamGuide1Repository>(
      IslamGuide1RepositoryImp(
        islamGuide1LocalDataSource: Get.find(),
      ),
    );

    Get.put(IslamGuide1ControllerImp());
  }
}
