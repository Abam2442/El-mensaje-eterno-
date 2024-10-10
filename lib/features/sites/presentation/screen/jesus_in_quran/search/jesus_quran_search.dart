import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/jesus_quran_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class JesusQuranSearch extends StatelessWidget {
  const JesusQuranSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Jesus in Quran').customAppBar(context),
      body: GetBuilder<JesusQuranControllerImp>(
          builder: (controller) => ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: controller.searchResult.length,
              itemBuilder: (context, index) {
                return InkwellCustom(
                  catigory: false,
                  dataText: controller.searchResult[index].name,
                  onTap: () {
                    Get.to(ArticalCustom(
                      dataText: controller.searchResult[index].content,
                    ));
                  },
                );
              })),
    );
  }
}
