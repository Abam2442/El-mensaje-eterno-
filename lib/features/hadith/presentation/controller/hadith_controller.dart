import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/helpers/get_state_from_failure.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/data/models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/usecases/get_hadithenc_hadithes_use_case.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/domain/usecases/get_sunnah_hadithes_use_case.dart';
import 'package:number_paginator/number_paginator.dart';

class HadithController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static HadithController get instance => Get.find<HadithController>();

  // Data
  SunnahHadithModel? sunnahHadithes;
  var searchResultArabic = [].obs;
  var searchResultEs = [].obs;

  GlobalKey<FormState> formState = GlobalKey();
  Rx<TextEditingController> searchController = TextEditingController().obs;
  void search(String query) {
    isSearching.value = query.isNotEmpty;
    searchResultArabic.clear();

    searchController.value.text = query;
    searchResultArabic.clear();
    sunnahHadithes?.sunnahHadithes.forEach(
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

  HaditencHadithModel? hadithencHadithes;
  List<Map> categoryHadithes = [];

  void searchFun(String val) {
    if (formState.currentState!.validate()) {
      searchResultArabic.clear();
      sunnahHadithes?.sunnahHadithes.forEach(
        (_, value) {
          value.forEach((key, value1) {
            value1.forEach((key, value) {
              if (value.toString().contains(val)) {
                searchResultArabic.add(value1['Arabic']);
                searchResultEs.add(value1['Español']);
              }
            });
          });
        },
      );
      hadithencHadithes?.hadithencHadithes.forEach(
        (_, value) {
          value.forEach((key, value1) {
            value1.forEach((key, value) {
              if (value.toString().contains(val)) {
                searchResultArabic.add(value1['Arabic']);
                searchResultEs.add(value1['Español']);
              }
            });
          });
        },
      );
      // searchResultArabic = searchResultArabic.toSet().toList();
      // searchResultEs = searchResultEs.toSet().toList();

      // log('$test');prin
      print(searchResultEs);
      print(searchResultArabic);

      // Get.to(() => const HadithSearchScreen());
      update();
    }
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

  List<String> bookHadithesName = [];
  List<String> getbookHadithesName(String title) {
    bookHadithesName.clear();
    print("getData");
    sunnahHadithes?.sunnahHadithes.forEach(
      (key, value) {
        if (key == title) {
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
                // print(hadith);
              });
            }
          });
        }
      },
    );
    print(hadith);
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
    print(hadith);
    return hadith;
  }
}
