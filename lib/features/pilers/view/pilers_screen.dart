import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/pilers/controller/pilers_controller.dart';

import '../../../core/constants/app_colors.dart';
import 'pilers_course_Screen.dart';

class PilersScreen extends StatelessWidget {
  PilersScreen({super.key});

  final PilersController pilersController = Get.put(PilersController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Obx(() => pilersController.isLoading.value
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
                    SvgPicture.asset(AppAssets.logoApp)
                  ],
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      pilersController.pilersModel.courses![0].title!,
                      style: Styles.textStyle14Green,
                    )),
                    Tab(child: Text(pilersController.pilersModel.courses![1].title!, style: Styles.textStyle14Green)),
                    Tab(child: Text(pilersController.pilersModel.courses![2].title!, style: Styles.textStyle14Green)),
                  ],
                ),
              ),
              backgroundColor: AppColors.kWhiteColor,
              body: TabBarView(
                children: [PilersCourseScreen(index: 0), PilersCourseScreen(index: 1), PilersCourseScreen(index: 2)],
              ),
            )),
    );
  }
}
