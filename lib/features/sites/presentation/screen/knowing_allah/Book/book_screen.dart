import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/knowing_allah_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import 'book_contain_screen.dart';

class KnowingAllahBookScreen extends StatelessWidget {
  const KnowingAllahBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KnowingAllahControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Knowing Allah book')
            .customAppBar(context),
        body: GetBuilder<KnowingAllahControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.knowingAllah!.books.length,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.knowingAllah!.books[index].name,
                        onTap: () {
                          Get.to(KnowingAllahBookContainScreen(
                            dataText: controller
                                .knowingAllah!.books[index].subcategories,
                            itemCount: controller.knowingAllah!.books[index]
                                .subcategories.length,
                          ));
                        },
                      );
                    }))));
  }
}
