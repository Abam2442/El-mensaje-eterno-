import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_appbar.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_shimmer.dart';
import 'package:hiwayda_oracion_islamica/features/pilers/controller/pilers_controller.dart';
import 'package:hiwayda_oracion_islamica/features/pilers/view/pilers_course_Screen.dart';

class PilersScreen extends GetView<PilersController> {
  const PilersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Obx(() => controller.isLoading.value
          ? Scaffold(
              appBar: CustomAppbar(title: Get.arguments['title'], tabs: const [
                Tab(
                  text: '',
                ),
                Tab(text: ''),
                Tab(text: ''),
              ]),
              body: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                shrinkWrap: true,
                itemBuilder: (context, index) => PrimaryShimmer.rectangle(
                  height: Get.height * 0.09,
                  color: AppColors.kGreenColor,
                  border: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: 8,
              ),
            )
          : Scaffold(
              appBar: CustomAppbar(
                title: Get.arguments['title'],
                tabs: controller.tabs,
              ),
              backgroundColor: AppColors.kscandryGreen,
              body: TabBarView(
                children: [
                  PilersCourseScreen(index: 0),
                  PilersCourseScreen(index: 1),
                  PilersCourseScreen(index: 2),
                ],
              ),
            )),
    );
  }
}
