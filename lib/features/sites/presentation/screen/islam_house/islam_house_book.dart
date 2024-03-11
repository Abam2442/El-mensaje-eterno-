import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/islam_house_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamHouseBookScreen extends StatelessWidget {
  const IslamHouseBookScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamHouseControllerImp());
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Islam House Book").customAppBar(context),
      body: GetBuilder<IslamHouseControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.content[2].length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.content[2][index].name
                         ,
                      onTap: () async {
                        await launchUrl(Uri.parse(controller
                            .content[2][index].content
                          ));
                      },
                    );
                  }))),
    );
  }
}
