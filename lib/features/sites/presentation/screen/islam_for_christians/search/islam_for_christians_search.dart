import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_for_christians_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_for_christians/islam_for_christians_title_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class IslamForChristiansSearch extends StatelessWidget {
  const IslamForChristiansSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam For Christians")
          .customAppBar(context),
      body: GetBuilder<IslamForChristiansControllerImp>(
        builder: (controller) => ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: controller.searchResult.length,
          itemBuilder: (context, index) {
            return InkwellCustom(
              catigory: false,
              dataText: controller.searchResult[index].name,
              onTap: () {
                Get.to(IslamForChristiansTitleScreen(
                  dataText: controller.searchResult[index].subCatigory,
                  itemCount: controller.searchResult[index].subCatigory.length,
                  index: index,
                ));
              },
            );
          },
        ),
      ),
    );
  }
}
