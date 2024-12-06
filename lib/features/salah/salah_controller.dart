
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/features/salah/data/model/tahara_lesson_model.dart';
import 'package:hiwayda_oracion_islamica/features/salah/domain/usecases/salah_use_case.dart';

class SalahController extends GetxController {
  static SalahController get instance => Get.find<SalahController>();
  StateType getSurahsState = StateType.init;
  List<TaharaLessonModel> lessonTahara = [];

  Future<void> getData() async {
    getSurahsState = StateType.loading;
    update();
    SalahUseCase salahUseCase = SalahUseCase(Get.find());
    var result = await salahUseCase();
    // return result;
    result.fold(
      (l) async {
        getSurahsState = getStateFromFailure(l);
        update();
        // validationMessage = l.message;
        // log('falied');
        await Future.delayed(const Duration(milliseconds: 50));
        getSurahsState = StateType.init;
        return Left(l);
      },
      (r) {
        getSurahsState = StateType.success;
        lessonTahara = r;
        update();
        return Right(r);

        // print(surahs);
        //
      },
    );
  }

  @override
  void onInit() async {
    await getData();

    // videoPlayerController = VideoPlayerController.asset('');
    super.onInit();
  }
}
