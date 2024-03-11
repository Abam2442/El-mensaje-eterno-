import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/faith/controller/faith_controller.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import 'faith_course_Screen.dart';

class FaithScreen extends StatelessWidget {
  FaithScreen({super.key});

  final FaithController faithController = Get.put(FaithController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Obx(() => faithController.isLoading.value
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pilers Lessons',
                      style: Styles.textStyle18Godlen,
                    ),
                    ClipRRect(
                        borderRadius: 10.cBorder,
                        child: SizedBox.fromSize(
                            size: const Size(60, 30),
                            child: SvgPicture.asset(
                              AppAssets.logo,
                              fit: BoxFit.fill,
                            )))
                  ],
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      faithController.faithModel.courses![0].title!,
                      style: Styles.textStyle14Green,
                    )),
                    Tab(child: Text(faithController.faithModel.courses![1].title!, style: Styles.textStyle14Green)),
                  ],
                ),
              ),
              backgroundColor: AppColors.kWhiteColor,
              body: TabBarView(
                children: [FaithCourseScreen(index: 0), FaithCourseScreen(index: 1)],
              ),
            )),
    );
  }
}
