import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_appbar.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_shimmer.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/controller/mooamalat_controller.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/view/mooamalat_course_Screen.dart';

class MooamalatScreen extends GetView<MooamalatController> {
  const MooamalatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Obx(() => controller.isLoading.value
          ? Scaffold(
              appBar: CustomAppbar(title: Get.arguments['title'], tabs: const [
                Tab(text: ''),
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
                  MooamalatCourseScreen(index: 0),
                  MooamalatCourseScreen(index: 1),
                  MooamalatCourseScreen(index: 2),
                  MooamalatCourseScreen(index: 3),
                  MooamalatCourseScreen(index: 4),
                ],
              ),
            )),
    );
  }
}
