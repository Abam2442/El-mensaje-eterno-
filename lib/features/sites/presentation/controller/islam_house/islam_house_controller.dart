import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../../domain/usecase/islam_house_usecase.dart';
import '../../screen/islam_house/islam_house_artical.dart';
import '../../screen/islam_house/islam_house_audio.dart';
import '../../screen/islam_house/islam_house_book.dart';
import '../../screen/islam_house/islam_house_fatwa.dart';
import '../../screen/islam_house/islam_house_videos.dart';

class IslamHouseControllerImp extends GetxController {
  List title = ['Videos', 'Audios', 'Books', 'Fatwas', 'Articales'];
  List page = [
    const IslamHouseVideoScreen(),
    const IslamHouseAudioScreen(),
    const IslamHouseBookScreen(),
    const IslamHouseFatwaScreen(),
    const IslamHouseArticalScreen(),
  ];
  List<List<FixedEntities>> content = [];
  List<IconData> icons = [
    Icons.tv_outlined,
    Icons.headphones_outlined,
    Icons.book_outlined,
    Icons.question_answer_outlined,
    Icons.article_sharp
  ];

  // States
  StateType getVideosState = StateType.init;
  StateType getAudiosState = StateType.init;
  StateType getArticalState = StateType.init;
  StateType getBookState = StateType.init;
  StateType getFatwaState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getContent() async {
    IslamHouseUseCase islamHouseUseCase = IslamHouseUseCase(Get.find());
    var result = await islamHouseUseCase.call();
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
