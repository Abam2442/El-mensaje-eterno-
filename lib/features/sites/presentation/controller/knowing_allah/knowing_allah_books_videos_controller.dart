// import 'package:elresala/features/sites/data/models/islam_qa.dart';
// import 'package:elresala/features/sites/domain/usecase/islam_qa_usecase.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/media_entity.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/usecase/knowing_allah_usecase.dart';
// import '../../domain/usecase/the_key_to_islam_2_usecase.dart';

class KnowingAllahVideosControllerImp extends GetxController {
  List<MediaCategoryEntity> data = [];

  // States
  StateType getDataState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getContent() async {
    KnowingAllahUseCase useCases = KnowingAllahUseCase(Get.find());
    var result = await useCases.getVideos();
    result.fold(
      (l) async {
        getDataState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getDataState = StateType.init;
      },
      (r) {
        getDataState = StateType.success;
        data = r;

        update();
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    await getContent();
  }
}
