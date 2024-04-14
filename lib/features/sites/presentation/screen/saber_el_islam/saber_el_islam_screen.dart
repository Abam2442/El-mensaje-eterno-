import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/saber_el_islam_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';
import 'saber_el_islam_artical_list.dart';

class SaberElIslamScreen extends StatelessWidget {
  const SaberElIslamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SaberElIslamControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Saber El Islam').customAppBar(context),
      body: GetBuilder<SaberElIslamControllerImp>(builder: (controller) {
        if (controller.articals.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: controller.articals.length,
                itemBuilder: (context, index) {
                  return InkwellCustom(
                    catigory: false,
                    dataText: controller.articals[index].name,
                    onTap: () {
                      Get.to(() => SaberElIslamArticalListScreen(
                            articals: controller.articals[index].articals,
                            name: controller.articals[index].name,
                          ));
                    },
                  );
                }));
      }),
    );
  }
}
