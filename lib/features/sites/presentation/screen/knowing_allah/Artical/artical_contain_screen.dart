import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/knowing_allah/Artical/search/artical_contain_search.dart';
import '../../../../domain/entities/fixed_entities.dart';
import '../../../controller/knowing_allah/knowing_allah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/artical_custom.dart';

class KnowingAllahArticalContainScreen extends StatelessWidget {
  final int itemCount;
  final List<FixedEntities> dataText;
  final int index;
  const KnowingAllahArticalContainScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KnowingAllahControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Artical').customAppBar(context),
      body: Column(
        children: [
          SearchFieldWidget(
              onSubmitted: (val) => {
                    controller.searchArticle(
                        val, controller.articals[index].subcategories),
                    Get.to(
                      () => KnowingAllahContainSearch(index: index),
                    ),
                  }),
          Expanded(
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
        ],
      ),
    );
  }
}
