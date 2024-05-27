import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';

import '../../../controller/rasuluallah/rasulullah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import 'artical_contain_screen.dart';

class RasuluallahArticalScreen extends StatelessWidget {
  const RasuluallahArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RasuluallhControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Rasul allah artical')
            .customAppBar(context),
        body: GetBuilder<RasuluallhControllerImp>(
            builder: (controller) => controller.getArticalsState !=
                    StateType.success
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: controller.articals.length,
                        itemBuilder: (context, index) {
                          return InkwellCustom(
                            catigory: false,
                            dataText: controller.articals[index].category,
                            onTap: () {
                              Get.to(ArticalContainScreen(
                                dataText: controller.articals[index].data,
                              ));
                            },
                          );
                        }))));
  }
}
