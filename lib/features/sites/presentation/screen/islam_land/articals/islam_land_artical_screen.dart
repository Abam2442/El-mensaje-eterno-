import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
import '../../../controller/islam_land/islam_land_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/artical_custom.dart';

class IslamLandArticalScreen extends StatelessWidget {
  const IslamLandArticalScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Land Articals")
          .customAppBar(context),
      body: GetBuilder<IslamLandControllerImp>(
        builder: (controller) => Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: CustomPaginator<FixedEntities>(
            data: controller.offlineArticals,
            getItemText: (item) => item.name,
            onItemTaped: (FixedEntities item) {
              Get.to(ArticalCustom(dataText: item.content));
            },
          ),
        ),
      ),
    );
  }
}
