import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/item%20_card.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/body_hadith_screen.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/sunnah_widgets/body_sunnah_screen.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(
        init: HadithController.instance,
        builder: (controller) {
          return controller.stateType == StateType.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        AppAssets.hadith,
                        height: 300,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFbac2b9),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  Get.to(() => const BodyHadithScreen());
                                  controller.hadithsData.isEmpty
                                      ? await controller.getHadithes()
                                      : null;
                                },
                                child: const ItemCard(titleSite: 'Hadith')),
                            GestureDetector(
                                onTap: () =>
                                    Get.to(() => const BodySunnahScreen()),
                                child: const ItemCard(titleSite: 'Sunnah')),
                            const SizedBox(
                              height: 300,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
        });
  }
}
