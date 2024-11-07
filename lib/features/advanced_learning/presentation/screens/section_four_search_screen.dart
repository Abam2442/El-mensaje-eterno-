import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/item%20_card.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/controller/advanced_learning_controller.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/screens/special_site.dart';

class SectionFourSearchScreen extends StatelessWidget {
  const SectionFourSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdvancedLearningController controller =
        AdvancedLearningController.instance;
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: controller.searchResult.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.changeSelectedPart(index);
                  Get.to(() => const SpecialSite());
                },
                child: ItemCard(
                  titleSite: controller.searchResult[index]['title'],
                ),
              );
            }),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
