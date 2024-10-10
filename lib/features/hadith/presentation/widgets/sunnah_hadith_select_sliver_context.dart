import 'dart:developer';

import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/sunnah_hadith_second_selected_screen.dart';

import '../../../../core/constants/app_pages_routes.dart';
import '../../../../core/widgets/primary_list_tile.dart';

class SunnahBookSelectSliver extends GetView<HadithController> {
  final int mainIndex;
  final String name;
  const SunnahBookSelectSliver(this.mainIndex, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.hadithsData[mainIndex].hadiths.keys.toList();
    return ListView.builder(
      itemCount: data.length,
      // physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        log(name);
        return PrimaryListTile(
          onTap: () {
            final imp = controller
                .hadithsData[mainIndex].hadiths[data[index]].keys
                .toList();
            final values =
                controller.hadithsData[mainIndex].hadiths[data[index]];
            Get.to(SunnahHadithSecondSelectedScreen(
              titles: imp,
              data: values,
            ));
            // Get.toNamed(
            //   AppPagesRoutes.contentHadithScreen,
            //   arguments: {
            //     "title": controller.bookHadithesNameForList[index],
            //     "bookName": Get.arguments['title'],
            //     "webside": "sunnah",
            //   },
            // );
          },
          ar: '',
          es: data[index],
          itemNumber: (controller.pageNumber * 20) + index + 1,
          isSaved: false,
        );
      },
    );
  }
}
