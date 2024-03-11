import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/islam_web_controller.dart';
import '../widget/app_bar_custom.dart';
import '../widget/inkwell_custom.dart';
import '../widget/listviewcustom.dart';

class IslamWebMainScreen extends StatelessWidget {
  const IslamWebMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IslamWebControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Web").customAppBar(context),
      body: GetBuilder<IslamWebControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.articals.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.articals[index].title,
                      onTap: () {
                        Get.to(ListViewCustom(
                            question: controller.articals[index].question,
                            answer: controller.articals[index].answer));
                      },
                    );
                  }))),
    );
  }
}
