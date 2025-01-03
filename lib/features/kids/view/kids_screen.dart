import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_shimmer.dart';
import 'package:hiwayda_oracion_islamica/features/kids/controller/kids_controller.dart';
import 'package:hiwayda_oracion_islamica/features/kids/view/kids_course_screen.dart';

class KidsScreen extends GetView<KidsController> {
  const KidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Obx(
        () => controller.isLoading.value
            ? Scaffold(
                appBar: AppBar(
                  iconTheme: const IconThemeData(
                    color: AppColors.kGoldenColor,
                  ),
                  backgroundColor: AppColors.kPrimaryColor,
                  title: Text(Get.arguments['title']),
                ),
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
                appBar: AppBar(
                  iconTheme: const IconThemeData(
                    color: AppColors.kGoldenColor,
                  ),
                  backgroundColor: AppColors.kPrimaryColor,
                  title: const Text(
                    'Tu Niño',
                    style: TextStyle(
                      color: AppColors.kGoldenColor,
                    ),
                  ),
                  // bottom: TabBar(
                  //   tabs: controller.tabs,
                  // ),
                ),
                backgroundColor: Colors.white,
                body: KidsCourseScreen()),
      ),
    );
  }
}
