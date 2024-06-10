import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/usecases/get_hadithenc_hadithes_use_case.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/usecases/get_sunnah_hadithes_use_case.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/screens/search/hadith_search_screen.dart';
import 'package:number_paginator/number_paginator.dart';

class HadithController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Data
  SunnahHadithModel? sunnahHadithes;

  GlobalKey<FormState> formState = GlobalKey();

  HaditencHadithModel? hadithencHadithes;
  List<Map> categoryHadithes = [];

  List searchResult = [];

  void searchFun(String val) {
    searchResult.clear();
    sunnahHadithes?.sunnahHadithes.forEach(
      (_, value) {
        value.forEach((key, value) {
          value.forEach((key, value) {
            if (value.toString().contains(val)) {
              searchResult.add(value.toString());
            }
          });
        });
      },
    );
    searchResult = searchResult.toSet().toList();
    // log('$test');
    Get.to(() => const HadithSearchScreen());
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
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    await getSunnahHadithes();
    await getHadithencHadithes();
  }

  Future<void> getSunnahHadithes() async {
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
        sunnahHadithes = r;
        print(sunnahHadithes?.sunnahHadithes.values);
        update();
      },
    );
  }

  List<String>? get getbookHadithesName {
    print("getData");
    List<String>? bookHadithesName = [];
    sunnahHadithes?.sunnahHadithes.forEach(
      (key, value) {
        if (key == Get.arguments['title']) {
          value.forEach((key, value) {
            if (isSearching.value) {
              if (value != null) {
                if (value.toString().contains(searchTextController.text)) {
                  bookHadithesName.add(key);
                }
              }
            } else {
              bookHadithesName.add(key);
            }
          });
        }
      },
    );
    return bookHadithesName;
  }

  List<String>? getSunnahHadith(
    String bookName,
    String hadithName,
  ) {
    List<String>? hadith = [];
    sunnahHadithes?.sunnahHadithes.forEach(
      (key, value) {
        if (key == bookName) {
          value.forEach((key, value) {
            if (key == hadithName) {
              value.forEach((key, value) {
                hadith.add(value);
              });
            }
          });
        }
      },
    );
    return hadith;
  }

  Future<void> getHadithencHadithes() async {
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
