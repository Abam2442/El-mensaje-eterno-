// import 'package:elresala/features/sites/data/models/islam_qa.dart';
// import 'package:elresala/features/sites/domain/usecase/islam_qa_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/data/models/knowing_allah_model.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/knowing_allah/Artical/artical_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/knowing_allah/Audio/audio_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/knowing_allah/Book/book_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/knowing_allah/Video/video_screen.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/usecase/knowing_allah_usecase.dart';
// import '../../domain/usecase/the_key_to_islam_2_usecase.dart';

class KnowingAllahControllerImp extends GetxController {
  List<IconData> icons = [
    Icons.headphones_outlined,
    Icons.tv_outlined,
    Icons.book_outlined,
    Icons.article_rounded,
  ];
  List<Map> page = [
    {
      "name": 'Audio',
      "route": const KnowingAllahAudioScreen(),
    },
    {
      "name": 'Video',
      "route": const KnowingAllahVideoScreen(),
    },
    {
      "name": 'Book',
      "route": const KnowingAllahBookScreen(),
    },
    {
      "name": 'Article',
      "route": const KnowingAllahArticalScreen(),
    }
  ];
  KnowingAllahModel? knowingAllah;
  // States
  StateType getArticalsState = StateType.init;

  // Primitive
  String validationMessage = '';

  Future<void> getArtical() async {
    await Future.delayed(const Duration(milliseconds: 200));
    KnowingAllahUseCase knowingAllahUseCase = KnowingAllahUseCase(Get.find());
    var result = await knowingAllahUseCase();
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
        knowingAllah = r;

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
