import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_land/islam_land_fatwa_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_land/fatwa/islam_land_fatwa_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/media_files_list_view.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';
class IslamLandFatwaMainScreen extends StatelessWidget {
  const IslamLandFatwaMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Land").customAppBar(context),
      body: GetBuilder<IslamLandFatawaControllerImp>(builder: (controller) {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListView(padding: const EdgeInsets.all(5), children: [
              InkwellCustom(
                iconData: Icons.question_answer,
                catigory: true,
                dataText: "Offline Fatwa",
                onTap: () {
                  Get.to(const IslamLandFatwaScreen());
                },
              ),
              InkwellCustom(
                iconData: Icons.question_answer_outlined,
                catigory: true,
                dataText: "Online Fatwa",
                onTap: () {
                  Get.to(MediaFilesListView(
                    title: "Islam Land Online Fatwa ",
                    data: controller.onLineFatwa,
                    mediaLinkType: MediaLinkType.viewOnly,
                  ));
                },
              )
            ]));
      }),
    );
  }
}
