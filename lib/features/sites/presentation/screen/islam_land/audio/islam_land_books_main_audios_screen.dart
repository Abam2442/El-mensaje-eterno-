import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_land_audio_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';

class IslamLandAudioMainScreen extends GetView<IslamLandAudioControllerImp> {
  const IslamLandAudioMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            const AppBarCustom(title: "Islam Land Audio").customAppBar(context),
        body: GetBuilder<IslamLandAudioControllerImp>(builder: (controller) {
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
                    mediaLinkType: MediaLinkType.viewOnly,
                  );
                }),
          );
        }));
  }
}
