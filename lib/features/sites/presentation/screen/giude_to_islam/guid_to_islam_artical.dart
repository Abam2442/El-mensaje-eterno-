import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/guide_to_islam_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';

class GuideToIslamArticalScreen extends StatelessWidget {
  const GuideToIslamArticalScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(GuideToIslamControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Guide To Islam Artical")
          .customAppBar(context),
      body: GetBuilder<GuideToIslamControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.content[4].length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.content[4][index].name,
                      onTap: () async {
                        await launchUrl(
                            Uri.parse(controller.content[4][index].content));
                      },
                    );
                  }))),
    );
  }
}
