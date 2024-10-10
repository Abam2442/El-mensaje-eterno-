// import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'body_hadithenc_screen.dart';
import 'body_sunnah_screen.dart';

class HadithWebsideSelectSliver extends GetView<HadithController> {
  const HadithWebsideSelectSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: TabBarView(
        controller: controller.tabController,
        children: const [
          BodySunnahScreen(),
          BodyHadithencScreen(),
        ],
      ),
    );
  }
}
