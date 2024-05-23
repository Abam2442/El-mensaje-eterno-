import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_land/islam_land_fatwa_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import '../../../widget/listviewcustom.dart';

class IslamLandFatwaScreen extends StatelessWidget {
  const IslamLandFatwaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Islam Land Fatwa").customAppBar(context),
      body: GetBuilder<IslamLandFatawaControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.offLineFatwa.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.offLineFatwa[index].title,
                      onTap: () {
                        Get.to(ListViewCustom(
                            question: controller.offLineFatwa[index].question,
                            answer: controller.offLineFatwa[index].answer));
                      },
                    );
                  }))),
    );
  }
}
