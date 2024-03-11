// ignore_for_file: camel_case_types

import 'package:get/get.dart';

import '../../../../core/constants/app_pages_routes.dart';

class Advanced_LearningController extends GetxController {
  int selectedPart = 0;

  List titlePart = [
    'El buscador de la verdad',
    'Enciclopedias islámicas',
    'AL-LÁH y su mensajero',
    'Guía al islam',
    'Temas islámicos',
    'Canales de telegram',
  ];

  List<List<Map>> page = [
    [
      {
        "title": "El buscador de la verdad",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "El buscador de la verdad",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "El buscador de la verdad",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "El buscador de la verdad",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "El buscador de la verdad",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "El buscador de la verdad",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
    ],
    [
      {
        "title": "Islam house",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.islamHouse,
      },
      {
        "title": "Islam web",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.islamWeb,
      },
      {
        "title": "Islam message",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.islamMessage,
      },
      {
        "title": "Islamqa",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "Islam religion",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.islamReligion,
      },
      {
        "title": "Islam land",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.islamLand,
      },
    ],
    [
      {
        "title": "Knowing allah",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "Rasul allah",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.rasulullah,
      },
      {
        "title": "Jesus is muslim",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.jesusIsMuslim,
      },
      {
        "title": "Jesus in quran",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.jesusInQuran,
      },
      {
        "title": "Islam for christians",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.islamForChristians,
      },
    ],
    [
      {
        "title": "Islam port",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.islamPort,
      },
      {
        "title": "Islam universe",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.islamUniverse,
      },
      {
        "title": "Explore islam",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.exploreIslam,
      },
      {
        "title": "Learning islam",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.learningIslam,
      },
      {
        "title": "Islam faith",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "Islam guide_1",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "Islam guide_2",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "Guide to islam",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "The key to islam_1",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "The key to islam_2",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "Saber el islam",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
    ],
    [
      {
        "title": "Islam religion of pace",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.islamReligionOfPace,
      },
      {
        "title": "Message of islam",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.messageOfIslam,
      },
      {
        "title": "Muhammad the messanger of god",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.muhammadTheMessangerOfGod,
      },
      {
        "title": "Romance in islam",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.romanceInIslam,
      },
      {
        "title": "Beginning and end",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.beginningAndEnd,
      },
      {
        "title": "Women in islam",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.womenInIslam,
      },
      {
        "title": "Love in islam",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.loveInIslam,
      },
      {
        "title": "First steps",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.firstSteps,
      },
      {
        "title": "Bidaa in islam",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.bidaaInIslam,
      },
      {
        "title": "Terminology",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.terminology,
      },
    ],
    [
      {
        "title": "Canales de telegram",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "Canales de telegram",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "Canales de telegram",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "Canales de telegram",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
      {
        "title": "Canales de telegram",
        "description": "Learn more about islam",
        "targetScreen": AppPagesRoutes.quranScreen,
      },
    ],
  ];

  changeSelectedPart(val) {
    selectedPart = val;

    update();
  }

  @override
  void onInit() {
    selectedPart;
    super.onInit();
  }
}
