// import 'package:elresala/features/advanced_learning/presentation/widgets/item%20_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/item%20_card.dart';

import '../controller/the_key_to_islam_2_controller.dart';
import '../widget/app_bar_custom.dart';
import 'the_key_to_islam_2/the_key_to_islam_2_article_view.dart';

class TheKeyToIslam2Screen extends StatelessWidget {
  const TheKeyToIslam2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const AppBarCustom(title: 'the key to islam 2').customAppBar(context),
      body: GetBuilder<TheKeyToIslam2ControllerImp>(
        builder: (c) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: c.articals.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => TheKeyToIslam2ArticalView(
                          theKeyToIslam2: c.articals[index],
                          title: 'número de artículo ${index + 1}',
                        ));
                  },
                  child: ItemCard(
                    titleSite: 'número de artículo ${index + 1}',
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
