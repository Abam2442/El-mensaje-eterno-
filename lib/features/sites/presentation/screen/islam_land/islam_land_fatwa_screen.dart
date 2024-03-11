import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/islam_land_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';
import '../../widget/listviewcustom.dart';

class IslamLandFatwaScreen extends StatelessWidget {
  const IslamLandFatwaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IslamLandControllerImp());
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Islam Land Fatwa").customAppBar(context),
      body: GetBuilder<IslamLandControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.fatwas.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.fatwas[index].title,
                      onTap: () {
                        Get.to(ListViewCustom(
                            question: controller.fatwas[index].question,
                            answer: controller.fatwas[index].answer));
                      },
                    );
                  }))),
    );
  }
}
