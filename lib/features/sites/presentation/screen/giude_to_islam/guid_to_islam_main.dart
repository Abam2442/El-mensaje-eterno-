import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/guide_to_islam/guide_to_islam_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';

class GuideToIslamMainScreen extends StatelessWidget {
  const GuideToIslamMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GuideToIslamControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Guide To Islam").customAppBar(context),
      body: GetBuilder<GuideToIslamControllerImp>(builder: (controller) {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: controller.title.length,
                itemBuilder: (context, index) {
                  return InkwellCustom(
                    catigory: true,
                    iconData: controller.icons[index],
                    dataText: controller.title[index],
                    onTap: () {
                      Get.to(controller.page[index]);
                    },
                  );
                }));
      }),
    );
  }
}
