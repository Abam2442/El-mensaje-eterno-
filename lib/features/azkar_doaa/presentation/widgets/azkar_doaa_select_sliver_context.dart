import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/widgets/body_azkar_screen.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/widgets/body_doaa_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AzkarDoaaSelectSliver extends GetView<AzkarDoaaController> {
  const AzkarDoaaSelectSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.kPrimaryColor,
          child: Stack(
            children: [ 
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.kWhiteColor,
                  ),
                  child: SizedBox(
                    height: Get.height,
                    child: TabBarView(
                      controller: controller.tabController,
                      children: controller.tabs.map(
                        (Tab tab) {
                          final String label = tab.text!.toLowerCase();
                          return label == "azkar"
                              ? const BodyAzkarScreen()
                              : const BodyDoaaScreen();
                        },
                      ).toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
