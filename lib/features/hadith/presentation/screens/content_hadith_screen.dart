import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/body_content_hadithenc_screen.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/body_content_sunnah_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentHadithScreen extends StatelessWidget {
  const ContentHadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HadithController());
    // Get.put(QuranController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBarWidget(
            backgroundColor: AppColors.kWhiteColor,
            iconColor: Color.fromRGBO(42, 44, 65, 1),
          ),
          Get.arguments["webside"] == "sunnah"
              ? const BodyContentSunnahScreen()
              : const BodyContentHadithencScreen(),
        ],
      ),
    );
  }
}
