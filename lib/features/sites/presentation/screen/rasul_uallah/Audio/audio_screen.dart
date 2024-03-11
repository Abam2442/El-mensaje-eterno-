import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/rasulullah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import 'audio_contain_screen.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RasuluallhControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Rasul allah audio').customAppBar(context),
        body: GetBuilder<RasuluallhControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.articals[0].catigory.length,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.articals[0].catigory[index].name,
                        onTap: () {
                          Get.to(AudioContainScreen(
                            dataText: controller
                                .articals[0].catigory[index].subCatigory,
                            itemCount: controller
                                .articals[0].catigory[index].subCatigory.length,
                          ));
                        },
                      );
                    }))));
  }
}
