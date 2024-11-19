import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/usecases/get_hadithenc_hadithes_use_case.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/usecases/get_sunnah_hadithes_use_case.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/model/sunnah_data_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/model/sunnah_item_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/sunnah_widgets/sunnah_json_data_screen.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/sunnah_widgets/sunnah_pdf_data_screen.dart';

class HadithController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static HadithController get instance => Get.find();

  List<SunnahHadithModel> hadithsData = [];
  GlobalKey<FormState> formState = GlobalKey();
  List<Map> categoryHadithes = [];
  List<SunnahHadithModel> searchResultArabic = <SunnahHadithModel>[].obs;
  // List<SunnahHadithModel> searchResultEs = <SunnahHadi>[].obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  var pageNumber = 0;
  List<SunnahDataModel> sunnahJsonData = [];
  late TabController tabController;
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Hadithenc'),
    const Tab(text: 'Sunnah'),
  ];
  final List<SunnahItemModel> sunnahData = [
    SunnahItemModel(
        title: 'La importancia de la Sunnah y los hadices en el Islam',
        subTitle:
            'Un libro que explica ,por qué se debe seguir la Sunnah y el peligro de abandonarla.',
        filePath: 'assets/books/sunnah.pdf',
        extenstion: 'pdf'),
    SunnahItemModel(
        title: 'Las Cuarenta Nawawíes',
        subTitle: 'Los 40 hadices más famosos de las palabras del Profeta.',
        filePath: 'assets/json/alnawawi.json',
        extenstion: 'json'),
    SunnahItemModel(
        title: 'Hadices Qudsíes',
        subTitle:
            'Hadices que Dios dijo a través de las palabras del Profeta Muhammad.',
        filePath: 'assets/books/ahadith.pdf',
        extenstion: 'pdf'),
    SunnahItemModel(
        title: 'Riyad as-Salihin',
        subTitle: 'Un gran número de hadices útiles en varias ramas del Islam.',
        filePath: 'assets/json/ryadelsalheen.json',
        extenstion: 'json'),
    SunnahItemModel(
        title: 'Ar-Rahiq al-Makhtum',
        subTitle:
            'Un libro completo sobre la biografía del Profeta Muhammad, la paz sea con él.',
        filePath: 'assets/books/elraheeq.pdf',
        extenstion: 'pdf')
  ];

  void search(String query) {
    searchResultArabic.clear();

    searchController.value.text = query;
    final arabicPattern = RegExp(r'[\u0600-\u06FF]');

    if (arabicPattern.hasMatch(query)) {
      for (int i = 0; i < hadithsData.length - 9; i++) {
        for (var items in hadithsData[i].hadiths.values) {
          items.forEach((key, value) {
            value['ar'].contains(query)
                ? searchResultArabic
                    .add(SunnahHadithModel(hadiths: value, bookName: ''))
                : null;
          });
        }
      }
    } else {
      for (int i = 0; i < hadithsData.length - 9; i++) {
        for (var items in hadithsData[i].hadiths.values) {
          items.forEach((key, value) {
            value['es'].contains(query)
                ? searchResultArabic
                    .add(SunnahHadithModel(hadiths: value, bookName: ''))
                : null;
          });
        }
      }
    }

    update();
  }

  Future<void> selectSection(int index) async {
    if (sunnahData[index].extenstion == 'pdf') {
      Get.to(() => SunnahPdfDataScreen(
            path: sunnahData[index].filePath,
          ));
    } else {
      await getSunnah(sunnahData[index].filePath);
    }
  }

  late StateType stateType;
  Future<void> getSunnah(String path) async {
    stateType = StateType.loading;
    update();
    GetHadithencHadithesUseCase getHadithencHadithesUseCase =
        GetHadithencHadithesUseCase(hadithRepo: Get.find());

    var result = await getHadithencHadithesUseCase(path);
    result.fold(
      (l) {
        stateType = StateType.badRequest;
        update();
      },
      (r) {
        sunnahJsonData = r;
        stateType = StateType.success;
        Get.to(() => const SunnahJsonDataScreen());

        update();
      },
    );
  }

  Future<void> getHadithes() async {
    stateType = StateType.loading;
    update();
    GetSunnahHadithesUseCase getSunnahHadithesUseCase =
        GetSunnahHadithesUseCase(Get.find());
    var result = await getSunnahHadithesUseCase();
    result.fold(
      (l) async {
        await Future.delayed(const Duration(milliseconds: 50));
        stateType = StateType.badRequest;
        update();
      },
      (r) {
        hadithsData.addAll(r);
        stateType = StateType.success;
        update();
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    stateType = StateType.init;
    await getHadithes();
  }
}
