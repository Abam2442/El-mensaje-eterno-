import 'package:hiwayda_oracion_islamica/features/hadith/data/data_sources/hadith_local_data_source.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/repository/hadith_repo_impl.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/repository/hadith_repo.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:get/get.dart';

class HadithBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<HadithLocalDataSource>(
      HadithLocalDataSourceImpl(),
    );
    Get.put<HadithRepo>(
      HadithRepoImpl(
        hadithLocalDataSource: Get.find(),
      ),
    );

    Get.put(HadithController());
  }
}
