import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/knowing_allah_books_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';

import '../../../widget/app_bar_custom.dart';

class KnowingAllahBookScreen extends StatelessWidget {
  const KnowingAllahBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(title: 'Knowing Allah book')
            .customAppBar(context),
        body: GetBuilder<KnowingAllahBooksControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return ViewOrDownloadInkwell(
                        fileType: 'pdf',
                        name: controller.data[index].name,
                        url: controller.data[index].url,
                        mediaLinkType: MediaLinkType.viewOnly,
                      );
                      ;
                    }))));
  }
}
