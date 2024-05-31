import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_enums.dart';
import '../../../../../core/helpers/get_state_from_failure.dart';
import '../../../domain/entities/fixed_entities.dart';
import '../../../domain/usecase/islam_land_usecase.dart';
import '../../screen/islam_land/articals/islam_land_artical_on_screen.dart';
import '../../screen/islam_land/articals/islam_land_artical_screen.dart';

class IslamLandControllerImp extends GetxController {
  List title = [
    'Artical Offline',
    'Artical Online',
  ];

  late TextEditingController searchController;
  List<IconData> icons = [
    Icons.article_rounded,
    Icons.article_outlined,
  ];
  List page = [
    const IslamLandArticalScreen(),
    const IslamLandArticalonScreen(),
  ];

  // States
  StateType getVideosState = StateType.init;

  // Primitive
  String validationMessage = '';

  List<FixedEntities> onlineArticals = [];
  List<FixedEntities> offlineArticals = [];
  List<FixedEntities> searchResult = [];

  void searchArticle() {
    for (var item in offlineArticals) {
      if (item.name.contains(searchController.text)) {
        searchResult.add(item);
      }
    }
  }

  Future<void> getContent() async {
    IslamLandUseCase islamLandUseCase = IslamLandUseCase(Get.find());
    var result = await islamLandUseCase.call();
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
        offlineArticals = r[0];
        onlineArticals = r[1];
        print(offlineArticals[0].content);
        update();
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    await getContent();
    searchController = TextEditingController();
  }
}
