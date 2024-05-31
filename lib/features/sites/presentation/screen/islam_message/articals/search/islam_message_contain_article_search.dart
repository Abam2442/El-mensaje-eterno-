import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import '../../../../controller/islam_messages/islam_message_controller.dart';
import '../../../../widget/app_bar_custom.dart';
import '../../../../widget/artical_custom.dart';

class IslamMessageContainArticalSearch extends StatelessWidget {
  final int index;

  const IslamMessageContainArticalSearch({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamMessageControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Message Artical")
          .customAppBar(context),
      body: GetBuilder<IslamMessageControllerImp>(
          builder: (controller) => Column(
                children: [
                  SearchFieldWidget(onSubmitted: (val) {
                    controller.searchInFun(val, index);
                  }),
                  Expanded(
                    child: CustomPaginator(
                        data: controller.searchResult,
                        getItemText: (artical) => artical.subArticalName,
                        onItemTaped: (item) {
                          Get.to(ArticalCustom(dataText: item.bodyArtical));
                        }),
                  ),
                ],
              )),
    );
  }
}
