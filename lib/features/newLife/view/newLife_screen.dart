import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_appbar.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_shimmer.dart';
import 'package:hiwayda_oracion_islamica/features/newLife/controller/newLife_controller.dart';
import 'package:hiwayda_oracion_islamica/features/newLife/view/newLife_course_Screen.dart';

class NewLifeScreen extends GetView<NewLifeController> {
  const NewLifeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Obx(() => controller.isLoading.value
          ? Scaffold(
              appBar: CustomAppbar(title: Get.arguments['title'], tabs: const [
                Tab(text: ''),
                Tab(text: ''),
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
              body: TabBarView(
                children: [
                  NewLifeCourseScreen(index: 0),
                  NewLifeCourseScreen(index: 1),
                  NewLifeCourseScreen(index: 2),
                  NewLifeCourseScreen(index: 3),
                ],
              ),
            )),
    );
  }
}
