// import 'package:elresala/features/advanced_learning/presentation/widgets/item%20_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';

import '../../../../advanced_learning/presentation/widgets/item _card.dart';
import '../../../data/models/islam_guide_1_model.dart';
import '../../widget/app_bar_custom.dart';

class IslamGuide1ChaptersScreen extends StatelessWidget {
  final List<Chapter0> chapters;
  final String title;
  const IslamGuide1ChaptersScreen(
      {super.key, required this.chapters, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: title).customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
          itemCount: chapters.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => ArticalCustom(
                      dataText: chapters[index].paragraphs,
                      // title: 'Article No ${index + 1}',
                    ));
              },
              child: Item_Card(
                titleSite: chapters[index].title,
                // subtitle: '',
              ),
            );
          },
        ),
      ),
    );
  }
}
