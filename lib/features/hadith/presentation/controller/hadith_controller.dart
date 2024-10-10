import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/usecases/get_sunnah_hadithes_use_case.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/model/sunnah_data_model.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/model/sunnah_item_model.dart';

class HadithController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static HadithController get instance => Get.find();

  List<SunnahHadithModel> hadithsData = [];
  GlobalKey<FormState> formState = GlobalKey();
  List<Map> categoryHadithes = [];
  var searchResultArabic = [].obs;
  var searchResultEs = [].obs;
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
    // isSearching.value = query.isNotEmpty;
    searchResultArabic.clear();

    searchController.value.text = query;
    searchResultArabic.clear();

    // hadithencHadithes?.hadithencHadithes.forEach(
    //   (_, value) {
    //     value.forEach((key, value1) {
    //       value1.forEach((key, value) {
    //         if (value.toString().contains(query)) {
    //           searchResultArabic.add(value1['Arabic']);
    //           searchResultEs.add(value1['Español']);
    //         }
    //       });
    //     });
    //   },
    // );

    print(searchResultArabic[0]);
    update();
  }

  Future<void> getSunnah(String path) async {
    try {
      String file = await rootBundle.loadString(path);
      List data = json.decode(file);
      final ref =
          data.map((element) => SunnahDataModel.fromjson(element)).toList();
      sunnahJsonData = ref;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getHadithes() async {
    GetSunnahHadithesUseCase getSunnahHadithesUseCase =
        GetSunnahHadithesUseCase(Get.find());
    var result = await getSunnahHadithesUseCase();
    result.fold(
      (l) async {
        await Future.delayed(const Duration(milliseconds: 50));
      },
      (r) {
        hadithsData.addAll(r);
        update();
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    await getHadithes();
  }
}
