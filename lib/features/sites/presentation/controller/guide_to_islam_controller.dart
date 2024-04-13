import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/giude_to_islam/guid_to_islam_artical.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/giude_to_islam/guid_to_islam_videos.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/fixed_entities.dart';
import '../../domain/usecase/guide_to_islam_usecase.dart';
import '../screen/giude_to_islam/guid_to_islam_audio.dart';
import '../screen/giude_to_islam/guid_to_islam_book.dart';

class GuideToIslamControllerImp extends GetxController {
  List title = ['Videos', 'Audios', 'Books', 'Articales'];
  List page = [
    const GuideToIslamVideoScreen(),
    const GuideToIslamAudioScreen(),
    const GuideToIslamBookScreen(),
    const GuideToIslamArticalScreen(),
  ];
  List<List<FixedEntities>> content = [];
  List<IconData> icons = [
    Icons.tv_outlined,
    Icons.headphones_outlined,
    Icons.book_outlined,
    Icons.article_sharp
  ];

  // States
  StateType getVideosState = StateType.init;
  StateType getAudiosState = StateType.init;
  StateType getArticalState = StateType.init;
  StateType getBookState = StateType.init;
  // StateType getFatwaState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getContent() async {
    GuideToIslamUseCase guideToIslamUseCase = GuideToIslamUseCase(Get.find());
    var result = await guideToIslamUseCase.call();
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

  @override
  void onInit() async {
    super.onInit();
    await getContent();
  }
}
