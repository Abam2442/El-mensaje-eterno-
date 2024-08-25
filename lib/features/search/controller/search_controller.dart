import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/controller/advanced_learning_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';
import 'package:hiwayda_oracion_islamica/features/navigation_screen/model/tab_bar_model.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';

class SearchScreenController extends GetxController {
  List<bool> isCheck = [true, false, false, false];
  final QuranController quranController = QuranController.instance;
  final HomeController homeController = HomeController.instance;
  final HadithController hadithController = HadithController.instance;
  final AdvancedLearningController _advancedLearningController =
      AdvancedLearningController.instance;

  late TextEditingController search;
  int selectedSection = 0;
  int itemCount = 0;
  List<TabBarModel> selection = [
    TabBarModel(text: 'El Corán', image: AppAssets.quran),
    TabBarModel(text: 'El musulmán', image: AppAssets.prayer),
    TabBarModel(text: 'El Hadiz', image: AppAssets.hadith),
    TabBarModel(text: 'La Avanzada edu', image: AppAssets.azkar)
  ];

  void searchFun(String searchQuery) {
    switch (selectedSection) {
      case 0:
        {
          quranController.search(searchQuery);
          itemCount = quranController.searchResults.length;
        }
        break;
      case 1:
        {
          homeController.search(searchQuery);
          itemCount = homeController.searchResult.length;
        }

      case 2:
        {
          hadithController.search(searchQuery);
          itemCount = hadithController.searchResultArabic.length;
        }
        break;
    }
    update();
  }

  onTap(int index) {
    selectedSection = index;
    itemCount = 0;
    print(selectedSection);
    for (int buttonIndex = 0; buttonIndex < isCheck.length; buttonIndex++) {
      if (buttonIndex == index) {
        isCheck[buttonIndex] = true;
      } else {
        isCheck[buttonIndex] = false;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }
}
