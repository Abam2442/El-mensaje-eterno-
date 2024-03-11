import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_pages_routes.dart';
import '../../../../core/widgets/primary_list_tile.dart';

class SunnahBookSelectSliver extends GetView<HadithController> {
  const SunnahBookSelectSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<HadithController>(
        builder: (controller) {
          List<String> bookHadithesName = controller.getbookHadithesName ?? [];
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: AppColors.kPrimaryColor,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        child: Container(
                          color: AppColors.kWhiteColor,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              ...List.generate(
                                bookHadithesName.length,
                                (index) {
                                  String hadithName =
                                      bookHadithesName[index];
                                  return PrimaryListTile(
                                    onTap: () {
                                      Get.toNamed(
                                        AppPagesRoutes.contentHadithScreen,
                                        arguments: {
                                          "title": hadithName,
                                          "bookName": Get.arguments['title'],
                                          "webside": "sunnah",
                                        },
                                      );
                                    },
                                    itemName: hadithName,
                                    itemNumber: index + 1,
                                    isSaved: false,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
