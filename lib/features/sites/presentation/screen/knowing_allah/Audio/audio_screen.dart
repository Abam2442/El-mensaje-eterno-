import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/knowing_allah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import 'audio_contain_screen.dart';

class KnowingAllahAudioScreen extends StatelessWidget {
  const KnowingAllahAudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Knowing Allah audio')
            .customAppBar(context),
        body: GetBuilder<KnowingAllahControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.knowingAllah!.audios.length,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.knowingAllah!.audios[index].name,
                        onTap: () {
                          Get.to(KnowingAllahAudioContainScreen(
                            dataText: controller
                                .knowingAllah!.audios[index].subcategories,
                            itemCount: controller.knowingAllah!.audios[index]
                                .subcategories.length,
                          ));
                        },
                      );
                    }))));
  }
}
