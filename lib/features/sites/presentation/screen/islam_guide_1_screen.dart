// import 'package:elresala/features/advanced_learning/presentation/widgets/item%20_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../advanced_learning/presentation/widgets/item _card.dart';
import '../controller/islam_guide_1_controller.dart';
import '../widget/app_bar_custom.dart';
import 'islam_guide_1/islam_guide_chapter_view.dart';

class IslamGuide1Screen extends StatelessWidget {
  const IslamGuide1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Islam Guide 1').customAppBar(context),
      body: GetBuilder<IslamGuide1ControllerImp>(
        builder: (c) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: c.articals.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => IslamGuide1ChaptersScreen(
                          chapters: c.articals[index].chapters,
                          title: 'Chapter ${index + 1}',
                        ));
                  },
                  child: Item_Card(
                    titleSite: 'Chapter ${index + 1}',
                    // subtitle: '',
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
