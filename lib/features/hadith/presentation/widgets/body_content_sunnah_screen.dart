import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';

import '../../../../core/styles/text_styles.dart';

class BodyContentSunnahScreen extends GetView<HadithController> {
  const BodyContentSunnahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String hadithName = Get.arguments["title"];
    List<String>? hadith =
        controller.getSunnahHadith(Get.arguments["bookName"], hadithName);
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 8,
              ),
              child: Text(
                hadithName,
                style: Styles.textStyle18Godlen,
              ),
            ),
            const SizedBox(height: 12),
            HadithContainer(hadith: hadith ?? []),
          ],
        ),
      ),
    );
  }
}
