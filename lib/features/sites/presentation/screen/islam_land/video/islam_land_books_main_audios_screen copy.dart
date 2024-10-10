import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_land/islam_land_videos_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';
import '../../../widget/app_bar_custom.dart';

class IslamLandVideosMainScreen extends GetView<IslamLandVideoControllerImp> {
  const IslamLandVideosMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(title: "Islam Land Videos")
            .customAppBar(context),
        body: GetBuilder<IslamLandVideoControllerImp>(builder: (controller) {
          if (controller.getDataState == StateType.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  final ele = controller.data.elementAt(index);
                  return ViewOrDownloadInkwell(
                    // iconData: controller.icons[index],
                    url: ele.url,
                    name: ele.name,
                    mediaLinkType: MediaLinkType.video,
                  );
                }),
          );
        }));
  }
}
