import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/knowing_allah/knowing_allah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
// ignore: unused_import
import 'artical_contain_screen.dart';

class KnowingAllahArticalScreen extends StatelessWidget {
  const KnowingAllahArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'knowing allah artical')
            .customAppBar(context),
        body: GetBuilder<KnowingAllahControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.knowingAllah!.articles.length,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.knowingAllah!.articles[index].name,
                        onTap: () {
                          Get.to(KnowingAllahArticalContainScreen(
                            dataText: controller
                                .knowingAllah!.articles[index].subcategories,
                            itemCount: controller.knowingAllah!.articles[index]
                                .subcategories.length,
                          ));
                        },
                      );
                    }))));
  }
}
