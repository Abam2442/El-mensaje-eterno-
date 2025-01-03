import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/context_size.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/controller/advanced_learning_controller.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/screens/special_site.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/widgets/item%20_card.dart';

class AdvancedSites extends StatelessWidget {
  const AdvancedSites({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdvancedLearningController>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              AppAssets.azkar,
              height: 300,
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFbac2b9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: controller.titlePart.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.changeSelectedPart(index);
                            Get.to(() => const SpecialSite());
                          },
                          child: ItemCard(
                            titleSite: controller.titlePart[index],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
