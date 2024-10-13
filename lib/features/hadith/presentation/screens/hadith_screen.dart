import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/body_hadith_screen.dart';
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/sunnah_widgets/body_sunnah_screen.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(
        init: HadithController.instance,
        builder: (controller) {
          return controller.stateType == StateType.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    TabBar(
                      tabs: controller.tabs,
                      controller: controller.tabController,
                      labelColor: AppColors.black,
                      unselectedLabelColor: const Color(0xFFffE4AC),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: AppColors.kGreenColor,
                    ),
                    SizedBox(
                      height: Get.height,
                      child: TabBarView(
                        controller: controller.tabController,
                        children: const [
                          BodyHadithScreen(),
                          BodySunnahScreen(),
                        ],
                      ),
                    )
                  ],
                );
        });
  }
}
