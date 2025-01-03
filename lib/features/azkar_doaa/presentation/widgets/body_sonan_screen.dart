import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';

import '../../../sites/presentation/widget/inkwell_custom.dart';
import 'day_night_sonan_screen.dart';
import 'timed_sonan_screen.dart';
import 'untimed_sonan_screen.dart';

class BodySonanScreen extends StatelessWidget {
  const BodySonanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.kGoldenColor,
        ),
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          'Sunna',
          style: TextStyle(
            color: AppColors.kGoldenColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            InkwellCustom(
              catigory: false,
              // iconData: controller.icons[index],
              dataText: 'Súplicas de día y de noche',
              onTap: () {
                Get.to(() => const DayNightSonanScreen());
              },
            ),
            InkwellCustom(
              catigory: false,
              // iconData: controller.icons[index],
              dataText: 'Súplicas específicas',
              onTap: () {
                Get.to(() => const TimedSonanScreen());
              },
            ),
            InkwellCustom(
              catigory: false,
              // iconData: controller.icons[index],
              dataText: 'Súplicas generales',
              onTap: () {
                Get.to(() => const UnTimedSonanScreen());
              },
            )
            // ItemCard(titleSite: ''),
            // ItemCard(titleSite: 'سنن موقوتة'),
            // ItemCard(titleSite: 'سنن غير موقوتة'),
          ],
        ),
      ),
    );
  }
}
