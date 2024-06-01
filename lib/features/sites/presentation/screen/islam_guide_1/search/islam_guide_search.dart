// import 'package:elresala/features/advanced_learning/presentation/widgets/item%20_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/widgets/item%20_card.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_guide_1_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';

class IslamGuideSearch extends StatelessWidget {
  const IslamGuideSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<IslamGuide1ControllerImp>();
    return Scaffold(
      appBar: const AppBarCustom(title: 'Islam Guide').customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
          itemCount: controller.searchResult.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => ArticalCustom(
                      dataText: controller.searchResult[index].paragraphs,
                    ));
              },
              child: Item_Card(
                titleSite: controller.searchResult[index].title,
              ),
            );
          },
        ),
      ),
    );
  }
}
