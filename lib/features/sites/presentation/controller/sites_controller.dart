import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/usecase/sites_usecase.dart';

class SitesController extends GetxController {
  List<FixedEntities> articals = [];
  SitesController(String fileName, String sectionName) {
    getArtical(fileName, sectionName);
  }

  // Primitive
  String validationMessage = '';

  Future<void> getArtical(fileName, sectionName) async {
    EasyLoaderService.showLoading();
    update();
    SitesUsecase sitesUseCase = SitesUsecase(sitesRepository: Get.find());
    var result = await sitesUseCase(fileName, sectionName);
    result.fold(
      (l) async {
        validationMessage = l.message;
        EasyLoaderService.dismiss();
        await Future.delayed(const Duration(milliseconds: 50));
        update();
      },
      (r) {
        EasyLoaderService.dismiss();

        articals = r;

        update();
      },
    );
  }
}
