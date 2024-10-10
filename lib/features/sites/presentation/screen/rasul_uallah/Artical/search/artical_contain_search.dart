import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/rasuluallah/rasulullah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';

class RasuluallahContainSearch extends StatelessWidget {
  final int index;
  const RasuluallahContainSearch({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RasuluallhControllerImp>();
    return Scaffold(
      appBar: const AppBarCustom(title: 'Artical').customAppBar(context),
      body: CustomPaginator(
        data: controller.searchResult,
        getItemText: (item) => item.name,
        onItemTaped: (item) {
          Get.to(ArticalCustom(
            dataText: item.content,
          ));
        },
      ),
    );
  }
}
