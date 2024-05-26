import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import '../../../../domain/entities/fixed_entities.dart';
import '../../../controller/knowing_allah/knowing_allah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/artical_custom.dart';

class KnowingAllahArticalContainScreen extends StatelessWidget {
  final int itemCount;
  final List<FixedEntities> dataText;
  const KnowingAllahArticalContainScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Artical').customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: CustomPaginator(
          data: dataText,
          getItemText: (item) => item.name,
          onItemTaped: (item) {
            Get.to(ArticalCustom(
              dataText: item.content,
            ));
          },
        ),
      ),
    );
  }
}
