import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/rasulullah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import 'artical_contain_screen.dart';

class ArticalScreen extends StatelessWidget {
  const ArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RasuluallhControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Rasul allah artical').customAppBar(context),
        body: GetBuilder<RasuluallhControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.articals[3].catigory.length,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.articals[3].catigory[index].name,
                        onTap: () {
                          Get.to(ArticalContainScreen(
                            dataText: controller
                                .articals[3].catigory[index].subCatigory,
                            itemCount: controller
                                .articals[3].catigory[index].subCatigory.length,
                          ));
                        },
                      );
                    }))));
  }
}
