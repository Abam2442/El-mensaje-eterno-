// import 'package:elresala/features/advanced_learning/presentation/widgets/custom_appBar.dart';
// import 'package:elresala/features/advanced_learning/presentation/widgets/item%20_card.dart';
// import 'package:elresala/features/sites/presentation/controller/the_key_to_islam_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../advanced_learning/presentation/widgets/item _card.dart';
import '../controller/the_key_to_islam_controller.dart';
import '../widget/app_bar_custom.dart';
import 'the_key_to_islam/the_key_to_islam_artical_screen.dart';

class TheKeyToIslamScreen extends StatelessWidget {
  const TheKeyToIslamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const AppBarCustom(title: 'the key to islam').customAppBar(context),
      body: GetBuilder<TheKeyToIslamControllerImp>(
        builder: (c) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: c.articals.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => TheKeyToIslamArticalView(
                          theKeyToIslamfirst: c.articals[index],
                        ));
                  },
                  child: Item_Card(
                    titleSite: c.articals[index].name,
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
