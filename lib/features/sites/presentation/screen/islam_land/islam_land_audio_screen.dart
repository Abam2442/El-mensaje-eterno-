import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/islam_land_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamLandAudioScreen extends StatelessWidget {
  const IslamLandAudioScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamLandControllerImp());
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Islam Land Audio").customAppBar(context),
      body: GetBuilder<IslamLandControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.content[1].length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.content[1][index].name,
                      onTap: () async {
                        await launchUrl(
                            Uri.parse(controller.content[1][index].content));
                      },
                    );
                  }))),
    );
  }
}
