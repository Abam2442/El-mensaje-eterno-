import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_house/islam_house_audios_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/media_files_list_view.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';

class IslamHouseAudios extends GetView<IslamHouseAudiosControllerImp> {
  const IslamHouseAudios({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (IslamHouseAudiosControllerImp controller) =>
          controller.getDataState == StateType.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : MediaFilesListView(
                  title: "Islam House Audios",
                  data: controller.data,
                  usePaginator: true,
                  mediaLinkType: MediaLinkType.viewOnly,
                ),
    );
  }
}