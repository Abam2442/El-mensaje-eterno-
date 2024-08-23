import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/screens/surah_screen.dart';

class SouraItem extends StatelessWidget {
  const SouraItem(
      {super.key,
      required this.souraNumber,
      required this.souraName,
      required this.isSaved});

  final int souraNumber;
  final String souraName;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    final QuranController controller = QuranController.instance;
    return InkWell(
      onTap: () {
        controller.currentAyat = controller.surahs[souraNumber - 1].ayat;
        controller.currentSurrah = souraNumber;
        controller.selectedTafsirs.clear();
        Get.to(() => const SurahScreen());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.kGreenColor,
        ),
        child: Row(
          children: [
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
          ],
        ),
      ),
    );
  }
}
