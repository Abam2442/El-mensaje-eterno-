import 'dart:ffi';

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_pages_routes.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SouraItem extends StatelessWidget {
  const SouraItem({super.key, required this.souraNumber, required this.souraName, required this.isSaved});

  final int souraNumber;
  final String souraName;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<QuranController>().currentAyat = Get.find<QuranController>().surahs[souraNumber - 1].ayat;
        Get.find<QuranController>().chapterNumber=souraNumber;
        Get.toNamed(AppPagesRoutes.surahScreen);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: AppColors.kGreenColor,
        ),
        child: Row(children: [
          Text(
            '$souraNumber',
            style: const TextStyle(
              color: AppColors.kWhiteColor,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            souraName,
            style: const TextStyle(
              color: AppColors.kGoldenColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          // const Spacer(),
          // const Text(
          //   'Markah',
          //   style: TextStyle(
          //     color: AppColors.kGoldenColor,
          //     fontSize: 12,
          //     fontWeight: FontWeight.w400,
          //   ),
          //   textAlign: TextAlign.end,
          // ),
          // const SizedBox(
          //   width: 30,
          // ),
          // SvgPicture.asset(
          //   isSaved == true ? AppAssets.kBookmarkFillIcon : AppAssets.kBookmarkIcon,
          // ),
        ]),
      ),
    );
  }
}