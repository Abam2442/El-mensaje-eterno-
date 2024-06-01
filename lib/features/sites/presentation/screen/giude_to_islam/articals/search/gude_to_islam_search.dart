import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/guide_to_islam/guide_to_islam_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';

class GuideToIslamSearch extends StatelessWidget {
  const GuideToIslamSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Guide To Islam Artical")
          .customAppBar(context),
      body: GetBuilder<GuideToIslamControllerImp>(
        builder: (controller) => controller.getArticalState != StateType.success
            ? const Center(child: CircularProgressIndicator())
            : CustomPaginator(
                data: controller.searchResult,
                getItemText: (item) => item.name,
                onItemTaped: (item) {
                  Get.to(() => ArticalCustom(dataText: item.content));
                },
              ),
      ),
    );
  }
}
