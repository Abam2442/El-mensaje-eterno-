import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/islam_land_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamLandArticalScreen extends StatelessWidget {
  const IslamLandArticalScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamLandControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Land Articals")
          .customAppBar(context),
      body: GetBuilder<IslamLandControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.content[2].length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.content[2][index].name,
                      onTap: () {
                        Get.to(ArticalCustom(
                            dataText: controller.content[2][index].content));
                      },
                    );
                  }))),
    );
  }
}
