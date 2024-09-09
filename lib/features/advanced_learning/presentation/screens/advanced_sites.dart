import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: controller.titlePart.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.changeSelectedPart(index);
                Get.to(() => const SpecialSite());
              },
              child: Item_Card(
                titleSite: controller.titlePart[index],
              ),
            );
          }),
    );
  }
}
