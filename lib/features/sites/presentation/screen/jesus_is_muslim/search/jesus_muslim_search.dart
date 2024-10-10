import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/jesus_muslim_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_with_image.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class JesusMuslimSearch extends StatelessWidget {
  const JesusMuslimSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Jesus is muslim").customAppBar(context),
      body: GetBuilder<JesusMuslimControllerImp>(
          builder: (controller) => ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: controller.searchResult.length,
              itemBuilder: (context, index) {
                return InkwellCustom(
                  catigory: false,
                  dataText: controller.searchResult[index].name,
                  onTap: () {
                    Get.to(() => ArticalImageCustom(
                          dataText: controller.searchResult[index].content,
                          imageLink: controller.searchResult[index].imageLink,
                        ));
                  },
                );
              })),
    );
  }
}
