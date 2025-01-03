import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_messages/islam_message_books_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/media_files_list_view.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';

import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';

class IslamMessageBooksMainScreen
    extends GetView<IslamMessageBooksControllerImp> {
  const IslamMessageBooksMainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppBarCustom(title: "Islam Message Books")
          .customAppBar(context),
      body: GetBuilder<IslamMessageBooksControllerImp>(builder: (controller) {
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
                  return InkwellCustom(
                    catigory: false,
                    dataText: controller.data.elementAt(index).category,
                    onTap: () {
                      Get.to(MediaFilesListView(
                        data: controller.data[index].data,
                        fileType: 'pdf',
                        title: controller.data[index].category,
                        mediaLinkType: MediaLinkType.viewAndDownload,
                      ));
                    },
                  );
                }));
      }),
    );
  }
}
