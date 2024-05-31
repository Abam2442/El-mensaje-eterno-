import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';
import '../../../controller/guide_to_islam/guide_to_islam_controller.dart';
import '../../../widget/app_bar_custom.dart';

class GuideToIslamArticalScreen extends StatelessWidget {
  const GuideToIslamArticalScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(GuideToIslamControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Guide To Islam Artical")
          .customAppBar(context),
      body: GetBuilder<GuideToIslamControllerImp>(
          builder: (controller) => controller.getArticalState !=
                  StateType.success
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: CustomPaginator(
                    data: controller.articals,
                    getItemText: (item) => item.name,
                    onItemTaped: (item) {
                      Get.to(() => ArticalCustom(dataText: item.content));
                    },
                  ),
                )),
    );
  }
}
