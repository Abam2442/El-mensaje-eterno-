import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/rasuluallah/rasulullah_videos_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/media_files_list_view.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';

class RasulutallahVideosScreen extends StatelessWidget {
  const RasulutallahVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(title: 'Rasul allah video')
            .customAppBar(context),
        body: GetBuilder<RasuluallhVideosControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.data.elementAt(index).category,
                        onTap: () {
                          Get.to(MediaFilesListView(
                            data: controller.data[index].data,
                            title: controller.data[index].category,
                            mediaLinkType: MediaLinkType.video,
                          ));
                        },
                      );
                    }))));
  }
}
