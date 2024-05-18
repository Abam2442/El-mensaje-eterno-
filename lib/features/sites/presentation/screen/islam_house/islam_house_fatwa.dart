import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_house/islam_house_fatwa_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamHouseFatwaScreen extends StatelessWidget {
  const IslamHouseFatwaScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Islam House Fatwa").customAppBar(context),
      body: GetBuilder<IslamHouseFatwaControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.data[index].name,
                      onTap: () {
                        Get.to(() => ArticalCustom(
                              dataText: controller.data[index].content,
                            ));
                      },
                    );
                  }))),
    );
  }
}
