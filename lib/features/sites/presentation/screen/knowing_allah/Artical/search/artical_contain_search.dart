import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/knowing_allah/knowing_allah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';

class KnowingAllahContainSearch extends StatelessWidget {
  final int index;
  const KnowingAllahContainSearch({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<KnowingAllahControllerImp>();
    return Scaffold(
      appBar: const AppBarCustom(title: 'Artical').customAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: CustomPaginator(
              data: controller.searchResult,
              getItemText: (item) => item.name,
              onItemTaped: (item) {
                Get.to(ArticalCustom(
                  dataText: item.content,
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
