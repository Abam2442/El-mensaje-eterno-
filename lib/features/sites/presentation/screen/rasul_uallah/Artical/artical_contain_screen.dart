import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/rasuluallah/rasulullah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/rasul_uallah/Artical/search/artical_contain_search.dart';
import '../../../../domain/entities/fixed_entities.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/artical_custom.dart';

class ArticalContainScreen extends StatelessWidget {
  final List<FixedEntities> dataText;
  final int index;
  const ArticalContainScreen({
    super.key,
    required this.dataText,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RasuluallhControllerImp>();
    return Scaffold(
        appBar: const AppBarCustom(title: 'Artical').customAppBar(context),
        body: Column(
          children: [
            SearchFieldWidget(
              text: 'Buscar en artículos',
              onSubmitted: (val) => {
                controller.searchSubArticle(
                    val, controller.articals[index].data),
                Get.to(() => RasuluallahContainSearch(
                      index: index,
                    ))
              },
              formState: controller.formState,
            ),
            Expanded(
              child: CustomPaginator(
                data: dataText,
                onItemTaped: (item) {
                  Get.to(ArticalCustom(
                    dataText: item.content,
                  ));
                },
                getItemText: (item) => item.name,
              ),
            ),
          ],
        ));
  }
}
