import 'dart:developer';

import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/usecases/get_hadithenc_hadithes_use_case.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/usecases/get_sunnah_hadithes_use_case.dart';
import 'package:logger/logger.dart';
import 'package:number_paginator/number_paginator.dart';

class HadithController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static HadithController get instance => Get.find();

  // Data
  List<SunnahHadithModel> hadithsData = [];
  GlobalKey<FormState> formState = GlobalKey();

  HaditencHadithModel? hadithencHadithes;
  List<Map> categoryHadithes = [];

  // List searchResult = [];
  var searchResultArabic = [].obs;
  var searchResultEs = [].obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;

  void search(String query) {
    isSearching.value = query.isNotEmpty;
    searchResultArabic.clear();

    searchController.value.text = query;
    searchResultArabic.clear();
    // sunnahHadithes?.sunnahHadithes.forEach(
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
    hadithencHadithes?.hadithencHadithes.forEach(
      (_, value) {
        value.forEach((key, value1) {
          value1.forEach((key, value) {
            if (value.toString().contains(query)) {
              searchResultArabic.add(value1['Arabic']);
              searchResultEs.add(value1['Español']);
            }
          });
        });
      },
    );
    // searchResultArabic = searchResultArabic.toSet().toList();
    // searchResultEs = searchResultEs.toSet().toList();

    print(searchResultArabic[0]);
    update();
  }

  testFun() {
    print(hadithsData[0]
        .hadiths['La revelación del Corán y su colección. (5)'][
            'Desde Aisha- que Al-láh esté complacido con ella- dijo: \"CUando el mensajero de Al-láh -que la paz y las bendiciones de Al-láh sean con él- recibía la revelación su frente sudaba, aunque hacía frío\".']
        .values);
  }

  // States
  StateType getSunnahHadithesState = StateType.init;
  StateType getHadithencHadithesState = StateType.init;

  // Primitive
  String validationMessage = '';

  //Searching
  var isSearching = false.obs;
  var searchTextController = TextEditingController();
  var searchFocusNode = FocusNode();
  RxBool isBack = true.obs;

  //Pagination
  var pageNumber = 0;
  final NumberPaginatorController pageController = NumberPaginatorController();
  var bookHadithesNameForList = <String>[].obs;
  var subCategoryHadithesNameForList = <String>[].obs;
  // Tab Bar
  late TabController tabController;
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Sunnah'),
    const Tab(text: 'Hadithenc'),
  ];
  // final PageController pageController = PageController();
  // final RxInt currentPage = 0.obs;

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit HadithController");
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    await getSunnahHadithes();
    await getHadithencHadithes();
    Get.find<Logger>().w("End onInit HadithController");
  }

  Future<void> getSunnahHadithes() async {
    Get.find<Logger>().i("Start `getHadithes` in |HadithController|");
    getSunnahHadithesState = StateType.loading;
    update();
    GetSunnahHadithesUseCase getSunnahHadithesUseCase =
        GetSunnahHadithesUseCase(Get.find());
    var result = await getSunnahHadithesUseCase();
    result.fold(
      (l) async {
        getSunnahHadithesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getSunnahHadithesState = StateType.init;
      },
      (r) {
        getSunnahHadithesState = StateType.success;
        print(r);
        hadithsData.addAll(r);
        print('success-******************************');
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getHadithes` in |HadithController| $getSunnahHadithesState");
  }

  // List<String>? get getbookHadithesName {
  //   print("getData");
  //   List<String>? bookHadithesName = [];
  //   sunnahHadithes?.sunnahHadithes.forEach(
  //     (key, value) {
  //       if (key == Get.arguments['title']) {
  //         value.forEach((key, value) {
  //           if (isSearching.value) {
  //             if (value != null) {
  //               if (value.toString().contains(searchTextController.text)) {
  //                 bookHadithesName.add(key);
  //               }
  //             }
  //           } else {
  //             bookHadithesName.add(key);
  //           }
  //         });
  //       }
  //     },
  //   );
  //   return bookHadithesName;
  // }

  // List<String>? getSunnahHadith(
  //   String bookName,
  //   String hadithName,
  // ) {
  //   List<String>? hadith = [];
  //   sunnahHadithes?.sunnahHadithes.forEach(
  //     (key, value) {
  //       if (key == bookName) {
  //         value.forEach((key, value) {
  //           if (key == hadithName) {
  //             value.forEach((key, value) {
  //               hadith.add(value);
  //             });
  //           }
  //         });
  //       }
  //     },
  //   );
  //   return hadith;
  // }

  Future<void> getHadithencHadithes() async {
    Get.find<Logger>().i("Start `getHadithes` in |HadithController|");
    getHadithencHadithesState = StateType.loading;
    update();
    GetHadithencHadithesUseCase getHadithencHadithesUseCase =
        GetHadithencHadithesUseCase(Get.find());
    var result = await getHadithencHadithesUseCase();
    result.fold(
      (l) async {
        getHadithencHadithesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getHadithencHadithesState = StateType.init;
      },
      (r) {
        getHadithencHadithesState = StateType.success;
        hadithencHadithes = r;
        update();
      },
    );
    Get.find<Logger>().w(
        "End `getHadithes` in |HadithController| $getHadithencHadithesState");
  }

  List<String>? get getCategorySubCategoriesName {
    List<String>? categorySubCategoryName = [];
    hadithencHadithes?.hadithencHadithes.forEach(
      (key, value) {
        if (key == Get.arguments['title']) {
          value.forEach((key, value) {
            categorySubCategoryName.add(key);
          });
        }
      },
    );
    return categorySubCategoryName;
  }

  List<String>? get getSubCategoryHadithesName {
    List<String>? subCategoryHadithesName = [];
    hadithencHadithes?.hadithencHadithes.forEach(
      (key, value) {
        if (key == Get.arguments['categoryName']) {
          value.forEach((key, value) {
            if (key == Get.arguments['title']) {
              value.forEach((key, value) {
                if (isSearching.value) {
                  if (value != null) {
                    print(value.toString());
                    if (value.toString().contains(searchTextController.text)) {
                      subCategoryHadithesName.add(key);
                    }
                  }
                } else {
                  subCategoryHadithesName.add(key);
                }
              });
            }
          });
        }
      },
    );
    return subCategoryHadithesName;
  }

  List<String>? getHadithencHadith(
    String categoryName,
    String subCategoryName,
    String hadithName,
  ) {
    List<String>? hadith = [];
    hadithencHadithes?.hadithencHadithes.forEach(
      (key, value) {
        if (key == categoryName) {
          value.forEach((key, value) {
            if (key == subCategoryName) {
              value.forEach((key, value) {
                if (key == hadithName) {
                  value.forEach((key, value) {
                    hadith.add(value);
                  });
                }
              });
            }
          });
        }
      },
    );
    return hadith;
  }
}
