import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/islam_message_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamMessageMainScreen extends StatelessWidget {
  const IslamMessageMainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamMessageControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Message").customAppBar(context),
      body: GetBuilder<IslamMessageControllerImp>(
          builder: (controller) => Container(
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
                  }))),
    );
  }
}
