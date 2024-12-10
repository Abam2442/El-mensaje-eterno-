import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_land/islam_land_audio_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/media_files_list_view.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';

class IslamLandAudioMainScreen extends StatelessWidget {
  const IslamLandAudioMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (IslamLandAudioControllerImp controller) => MediaFilesListView(
        title: "Islam Land Audio",
        data: controller.data,
        mediaLinkType: MediaLinkType.viewOnly,
      ),
    );
  }
}
