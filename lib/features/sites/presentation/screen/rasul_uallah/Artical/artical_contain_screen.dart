import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import '../../../../domain/entities/fixed_entities.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/artical_custom.dart';

class ArticalContainScreen extends StatelessWidget {
  final List<FixedEntities> dataText;
  const ArticalContainScreen({
    super.key,
    required this.dataText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(title: 'Artical').customAppBar(context),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: CustomPaginator(
              data: dataText,
              onItemTaped: (item) {
                Get.to(ArticalCustom(
                  dataText: item.content,
                ));
              },
              getItemText: (item) => item.name,
            )));
  }
}
