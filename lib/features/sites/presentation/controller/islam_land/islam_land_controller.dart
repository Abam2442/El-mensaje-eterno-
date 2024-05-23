import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../../domain/entities/islam_land_entities.dart';
import '../../../domain/usecase/islam_land_usecase.dart';
import '../../screen/islam_land/islam_land_artical_on_screen.dart';
import '../../screen/islam_land/islam_land_artical_screen.dart';
import '../../screen/islam_land/islam_land_audio_screen.dart';
import '../../screen/islam_land/fatwa/islam_land_fatwa_on_screen.dart';
import '../../screen/islam_land/fatwa/islam_land_fatwa_screen.dart';
import '../../screen/islam_land/islam_land_video_screen.dart';

class IslamLandControllerImp extends GetxController {
  List title = [
    'Video',
    'Audio',
    'Artical Offline',
    'Artical Online',
    'Fatwa',
    'Fatwa Online'
  ];
  List<IconData> icons = [
    Icons.tv_outlined,
    Icons.headphones_outlined,
    Icons.article_rounded,
    Icons.article_outlined,
    Icons.question_answer,
    Icons.question_answer_outlined,
  ];
  List page = [
    const IslamLandVideoScreen(),
    const IslamLandAudioScreen(),
    const IslamLandArticalScreen(),
    const IslamLandArticalonScreen(),
    const IslamLandFatwaScreen(),
    const IslamLandFatwaonScreen(),
  ];
  List<List<FixedEntities>> content = [];
  List<IslamLandFatwaEntities> fatwas = [];

  // States
  StateType getVideosState = StateType.init;
  StateType getAudiosState = StateType.init;
  StateType getArticalOffState = StateType.init;
  StateType getArticalOnState = StateType.init;
  StateType getFatwaState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getContent() async {
    IslamLandUseCase islamLandUseCase = IslamLandUseCase(Get.find());
    var result = await islamLandUseCase.call();
    result.fold(
      (l) async {
        getVideosState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getVideosState = StateType.init;
      },
      (r) {
        getVideosState = StateType.success;
        content = r;

        update();
      },
    );
  }

  Future<void> getFatwa() async {
    IslamLandUseCase islamLandUseCase = IslamLandUseCase(Get.find());
    var result;
    result.fold(
      (l) async {
        getAudiosState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getAudiosState = StateType.init;
      },
      (r) {
        getAudiosState = StateType.success;
        fatwas = r;

        update();
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    await getContent();
    await getFatwa();
  }
}
