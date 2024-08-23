import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_land/islam_land_fatwa_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/listviewcustom.dart';

class IslamLandFatwaScreen extends StatelessWidget {
  const IslamLandFatwaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Islam Land Fatwa").customAppBar(context),
      body: GetBuilder<IslamLandFatawaControllerImp>(
          builder: (controller) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: CustomPaginator(
                  data: controller.offLineFatwa,
                  getItemText: (item) => item.title,
                  onItemTaped: (item) {
                    Get.to(ListViewCustom(
                        question: item.question, answer: item.answer));
                  }))),
    );
  }
}
