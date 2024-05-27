import 'package:hiwayda_oracion_islamica/features/quran/domain/entities/ayah_entity.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_arabic_container.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/multicopy_quran_page_widget.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/quran_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'multicopy_aya_language_container.dart';

class MultiCopyAyaContainer extends StatelessWidget {
  final Ayah ayah;
  final int number;

  const MultiCopyAyaContainer({required this.number, required this.ayah, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultiCopyQuranPageWidget(number: number, ayah: ayah),
        const SizedBox(height: 12),
        AyaArabicContainer(ayaArabic: ayah.arabic, ayaNumber: number),
        const SizedBox(height: 12),
        GetBuilder<QuranController>(
          id: "ayaNonArabic",
          builder: (controller) => MultiCopyAyaLanguageContainer(
            ayaNonArabic: controller.selectedTranslator == 1
                ? ayah.julioCortes
                : controller.selectedTranslator == 2
                    ? ayah.raulGonzalezBornez
                    : ayah.muhammadIsaGarcia,
            ayaNumber: number,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
