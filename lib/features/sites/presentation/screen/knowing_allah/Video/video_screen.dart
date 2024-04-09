import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/knowing_allah_controller.dart';
import '../../../controller/rasulullah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import 'video_contain_screen.dart';

class KnowingAllahVideoScreen extends StatelessWidget {
  const KnowingAllahVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Knowing Allah video')
            .customAppBar(context),
        body: GetBuilder<KnowingAllahControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.knowingAllah!.videos.length,
                    itemBuilder: (context, index) {
                      return controller
                              .knowingAllah!.videos[index].subcategories.isEmpty
                          ? Container()
                          : InkwellCustom(
                              catigory: false,
                              dataText:
                                  controller.knowingAllah!.videos[index].name,
                              onTap: () {
                                Get.to(KnowingAllahVideoContainScreen(
                                  dataText: controller.knowingAllah!
                                      .videos[index].subcategories,
                                  itemCount: controller.knowingAllah!
                                      .videos[index].subcategories.length,
                                ));
                              },
                            );
                    }))));
  }
}
