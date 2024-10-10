import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/rasuluallah/rasulullah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/rasul_uallah/Artical/artical_contain_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class RasuluallahArticalSearch extends StatelessWidget {
  const RasuluallahArticalSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'knowing allah artical')
          .customAppBar(context),
      body: GetBuilder<RasuluallhControllerImp>(
        builder: (controller) => ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: controller.searchResult.length,
            itemBuilder: (context, index) {
              return InkwellCustom(
                catigory: false,
                dataText: controller.searchResult[index].category,
                onTap: () {
                  Get.to(ArticalContainScreen(
                    dataText: controller.articals[index].data,
                    index: index,
                  ));
                },
              );
            }),
      ),
    );
  }
}
