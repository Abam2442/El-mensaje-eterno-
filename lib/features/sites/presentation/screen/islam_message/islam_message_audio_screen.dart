import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/islam_message_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamMessageAudioScreen extends StatelessWidget {
  const IslamMessageAudioScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamMessageControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Message Audio").customAppBar(context),
      body: GetBuilder<IslamMessageControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.audios.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.audios[index].name,
                      onTap: () async {
                        await launchUrl(
                            Uri.parse(controller.audios[index].link));
                      },
                    );
                  }))),
    );
  }
}
