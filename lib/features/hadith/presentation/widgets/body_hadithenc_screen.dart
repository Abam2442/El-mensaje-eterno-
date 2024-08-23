import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/handle_states_widget.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../../core/constants/app_pages_routes.dart';
import '../../../../core/widgets/primary_shimmer.dart';

class BodyHadithencScreen extends GetView<HadithController> {
  const BodyHadithencScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(
      builder: (controller) => SingleChildScrollView(
        child: HandleStatesWidget(
          stateType: controller.getHadithencHadithesState,
          hasShimmer: true,
          shimmerChild: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
            shrinkWrap: true,
            itemBuilder: (context, index) => PrimaryShimmer.rectangle(
              height: Get.height * 0.09,
              color: AppColors.kGreenColor,
              border: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemCount: 6,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                ...List.generate(
                  controller.hadithencHadithes?.categoriesName.length ?? 0,
                  (index) {
                    // String categoryName =
                    //     controller.hadithencHadithes!.categoriesName[index];
                    return PrimaryListTile(
                      onTap: () {
                        Get.toNamed(
                          AppPagesRoutes.subCategoryScreen,
                          arguments: {
                            "title": controller
                                .hadithencHadithes!.categoriesName[index],
                          },
                        );
                        // Get.toNamed(
                        //   AppPagesRoutes.bookHadithesScreen,
                        //   arguments: {
                        //     "title": categoryName,
                        //     "webside": "hadithenc",
                        //   },
                        // );
                      },
                      es: controller.hadithencHadithes!.categoriesName[index],
                      ar: '',
                      itemNumber: index + 1,
                      isSaved: false,
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
