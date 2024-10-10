import 'package:hiwayda_oracion_islamica/core/constants/app_pages_routes.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/screens/book_hadithes_screen.dart';

class BodySunnahScreen extends GetView<HadithController> {
  const BodySunnahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 220),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.hadithsData.length,
            itemBuilder: (context, index) {
              String bookName = controller.hadithsData[index].bookName;
              return PrimaryListTile(
                onTap: () {
                  Get.to(BookHadithesScreen(
                      index, 'sunnah', controller.hadithsData[index].bookName));
                  // Get.toNamed(
                  //   AppPagesRoutes.bookHadithesScreen,
                  //   arguments: {
                  //     "isHadithenc": "false",
                  //     "title": bookName,
                  //     "webside": "sunnah",
                  //   },
                  // );
                },
                es: bookName,
                itemNumber: index + 1,
                ar: '',
                isSaved: false,
              );
            }),
      );
    });
  }
}
