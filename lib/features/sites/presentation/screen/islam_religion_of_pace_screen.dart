import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/islam_religion_of_pace_controller.dart';
import '../widget/app_bar_custom.dart';
import '../widget/artical_custom.dart';
import '../widget/inkwell_custom.dart';

class IslamReligionOfPaceScreen extends StatelessWidget {
  const IslamReligionOfPaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IslamReligionOfPaceControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Islam religion of peace')
          .customAppBar(context),
      body: GetBuilder<IslamReligionOfPaceControllerImp>(
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
                        Get.to(ArticalCustom(
                          dataText: controller.articals[index].content,
                        ));
                      },
                    );
                  }))),
    );
  }
}
