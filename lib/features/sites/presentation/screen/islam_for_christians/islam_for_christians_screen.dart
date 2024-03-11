import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/islam_for_christians_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';
import 'islam_for_christians_title_screen.dart';

class IslamForChristiansScreen extends StatelessWidget {
  const IslamForChristiansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IslamForChristiansControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam For Christians")
          .customAppBar(context),
      body: GetBuilder<IslamForChristiansControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.articals.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.articals[index].name,
                      onTap: () {
                        Get.to(IslamForChristiansTitleScreen(
                          dataText: controller.articals[index].subCatigory,
                          itemCount:
                              controller.articals[index].subCatigory.length,
                        ));
                      },
                    );
                  }))),
    );
  }
}
