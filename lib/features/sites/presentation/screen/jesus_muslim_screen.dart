import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/jesus_muslim_controller.dart';
import '../widget/app_bar_custom.dart';
import '../widget/artical_with_image.dart';
import '../widget/inkwell_custom.dart';

class JesusMuslimScreen extends StatelessWidget {
  const JesusMuslimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JesusMuslimControllerImp());
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Jesus is muslim").customAppBar(context),
      body: GetBuilder<JesusMuslimControllerImp>(
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
                        Get.to(ArticalImageCustom(
                          dataText: controller.articals[index].content,
                          imageLink: controller.articals[index].imageLink,
                        ));
                      },
                    );
                  }))),
    );
  }
}
