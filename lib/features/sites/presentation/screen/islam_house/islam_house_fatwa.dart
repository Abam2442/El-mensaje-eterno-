import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/islam_house_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamHouseFatwaScreen extends StatelessWidget {
  const IslamHouseFatwaScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamHouseControllerImp());
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Islam House Fatwa").customAppBar(context),
      body: GetBuilder<IslamHouseControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.content[3].length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.content[3][index].name,
                      onTap: () {
                        Get.to(ArticalCustom(
                          dataText: controller.content[3][index].content,
                        ));
                      },
                    );
                  }))),
    );
  }
}
