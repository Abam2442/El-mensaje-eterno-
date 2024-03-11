import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/islam_religion_entities.dart';
import '../../domain/usecase/islam_religion_usecase.dart';
import '../screen/rasul_uallah/Artical/artical_screen.dart';
import '../screen/rasul_uallah/Audio/audio_screen.dart';
import '../screen/rasul_uallah/Book/book_screen.dart';
import '../screen/rasul_uallah/Video/video_screen.dart';

class RasuluallhControllerImp extends GetxController {
  List<IconData> icons = [
    Icons.headphones_outlined,
    Icons.tv_outlined,
    Icons.book_outlined,
    Icons.article_rounded,
  ];
  List<Widget> page = [
    const AudioScreen(),
    const VideoScreen(),
    const BookScreen(),
    const ArticalScreen(),
  ];
  List<IslamReligionEntities> articals = [];
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getArtical() async {
    IslamReligionUseCase rasulullahUseCase = IslamReligionUseCase(Get.find());
    var result = await rasulullahUseCase();
    result.fold(
      (l) async {
        getArticalsState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getArticalsState = StateType.init;
      },
      (r) {
        getArticalsState = StateType.success;
        articals = r;

        update();
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    await getArtical();
  }
}
