import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/surah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/domain/usecases/get_surahs_use_case.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class QuranController extends GetxController {
  // Data
  List<Surah> surahs = [];
  List<Ayah> resultAyat = [];
  List<Ayah> currentAyat = [];

  // States
  StateType getSurahsState = StateType.init;
  StateType searchAboutAyahState = StateType.init;

  // Primitive
  String validationMessage = '';
  int selectedTranslator = 1;

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit QuranController");
    super.onInit();
    await getSurahs();
    Get.find<Logger>().w("End onInit QuranController");
  }

  Future<void> getSurahs() async {
    Get.find<Logger>().i("Start `getSurahs` in |QuranController|");
    getSurahsState = StateType.loading;
    update();
    GetSurahsUseCase getSurahsUseCase = GetSurahsUseCase(Get.find());
    var result = await getSurahsUseCase();
    result.fold(
      (l) async {
        getSurahsState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getSurahsState = StateType.init;
      },
      (r) {
        getSurahsState = StateType.success;
        surahs = r;
        update();
      },
    );
    Get.find<Logger>().w("End `getSurahs` in |QuranController| $getSurahsState");
  }

  Future<void> searchAboutAyah(String query) async {
    Get.find<Logger>().i("Start `searchAboutAyah` in |QuranController|");
    searchAboutAyahState = StateType.loading;
    update();
    resultAyat = [];
    for (var surah in surahs) {
      resultAyat = surah.ayat
          .where(
            (element) => element.arabic.contains(query),
          )
          .toList();
    }
    searchAboutAyahState = StateType.success;
    update();
    Get.find<Logger>().w("End `searchAboutAyah` in |QuranController| $searchAboutAyahState");
  }
}
