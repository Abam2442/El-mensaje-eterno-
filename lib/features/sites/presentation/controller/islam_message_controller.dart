import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_enums.dart';
import '../../../../core/helpers/get_state_from_failure.dart';
import '../../domain/entities/islam_message_entities.dart';
import '../../domain/usecase/islam_message_usecase.dart';
import '../screen/islam_message/islam_message_artical_screen.dart';
import '../screen/islam_message/audios/islam_message_audio_screen.dart';
import '../screen/islam_message/islam_message_book_screen.dart';

class IslamMessageControllerImp extends GetxController {
  List title = ['articles', 'books', 'audios'];
  List<IconData> icons = [
    Icons.article_rounded,
    Icons.book_outlined,
    Icons.headphones_outlined,
  ];
  List page = [
    const IslamMessageArticalScreen(),
    const IslamMessageBookScreen(),
    // const IslamMessageAudioScreen(),
  ];
  List<IslamMessageArticalEntities> articals = [];
  List<IslamMessageBookEntities> books = [];
  List<IslamMessageAudioEntities> audios = [];
  // States
  StateType getArticalsState = StateType.init;
  // StateType getBooksState = StateType.init;
  StateType getAudiosState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getArtical() async {
    IslamMessageUseCase islamMessageUseCase = IslamMessageUseCase(Get.find());
    var result = await islamMessageUseCase.callArtical();
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

  Future<void> getAudio() async {
    // IslamMessageUseCase islamMessageUseCase = IslamMessageUseCase(Get.find());
    // var result = await islamMessageUseCase.callAudio();
    // result.fold(
    //   (l) async {
    //     getAudiosState = getStateFromFailure(l);
    //     validationMessage = l.message;
    //     update();
    //     await Future.delayed(const Duration(milliseconds: 50));
    //     getArticalsState = StateType.init;
    //   },
    //   (r) {
    //     getArticalsState = StateType.success;
    //     audios = r;

    //     update();
    //   },
    // );
  }

  @override
  void onInit() async {
    super.onInit();
    await getArtical();
    await getAudio();
    // await getBook();
  }
}
