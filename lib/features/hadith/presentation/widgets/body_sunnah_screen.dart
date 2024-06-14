import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/handle_states_widget.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../../core/constants/app_pages_routes.dart';
import '../../../../core/widgets/primary_shimmer.dart';

class BodySunnahScreen extends GetView<HadithController> {
  const BodySunnahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(
      builder: (controller) => SingleChildScrollView(
        child: HandleStatesWidget(
          stateType: controller.getSunnahHadithesState,
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
                  controller.sunnahHadithes?.booksName.length ?? 0,
                  (index) {
                    String bookName =
                        controller.sunnahHadithes!.booksName[index];
                    return PrimaryListTile(
                      onTap: () {
                        controller.pageNumber = 0;
                        controller.getbookHadithesName?.clear();
                        controller.update();
                        Get.toNamed(
                          AppPagesRoutes.bookHadithesScreen,
                          arguments: {
                            "isHadithenc": "false",
                            "title": bookName,
                            "webside": "sunnah",
                          },
                        );
                      },
                      es: bookName,
                      itemNumber: index + 1,
                      ar: '',
                      isSaved: false,
                    );
                  },
                ),
                const SizedBox(height: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
