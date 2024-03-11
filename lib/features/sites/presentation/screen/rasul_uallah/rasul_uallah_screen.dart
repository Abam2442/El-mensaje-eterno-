import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../controller/rasulullah_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';

class RasuluallahScreen extends StatelessWidget {
  const RasuluallahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RasuluallhControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Rasul Allah').customAppBar(context),
      backgroundColor: AppColors.kWhiteColor,
      body: GetBuilder<RasuluallhControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.only(top: 10, right: 5, left: 5),
              child: ListView.builder(
                  itemCount: controller.articals.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: true,
                      iconData: controller.icons[index],
                      dataText: controller.articals[index].name,
                      onTap: () {
                        Get.to(controller.page[index]);
                      },
                    );
                  }))),
    );
  }
}
