import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/islam_land/islam_land_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamLandMainScreen extends StatelessWidget {
  const IslamLandMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Land").customAppBar(context),
      body: GetBuilder<IslamLandControllerImp>(builder: (controller) {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: controller.title.length,
                itemBuilder: (context, index) {
                  return InkwellCustom(
                    iconData: controller.icons[index],
                    catigory: true,
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
