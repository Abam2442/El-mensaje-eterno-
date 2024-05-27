import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_text.dart';
import 'package:flutter/material.dart';

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';

class AyaArabicContainer extends StatelessWidget {
  final String ayaArabic;
  final int ayaNumber;

  const AyaArabicContainer(
      {required this.ayaArabic, required this.ayaNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuranController>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: controller.isAyaPlaying(ayaNumber) ? AppColors.kBlueColor : AppColors.kGreenColor,
          ),
          alignment: Alignment.center,
          child: AyaText(aya: ayaArabic, ayaNumber: ayaNumber),
        );
      }
    );
  }
}
