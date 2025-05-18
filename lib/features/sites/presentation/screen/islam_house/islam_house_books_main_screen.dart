import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_house/islam_house_books_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/view_or_download_inkwell.dart';
import '../../widget/app_bar_custom.dart';

class IslamHouseBooksMainScreen extends StatelessWidget {
  const IslamHouseBooksMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Islam House Books").customAppBar(context),
      body: GetBuilder<IslamHouseBooksControllerImp>(builder: (controller) {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                }));
      }),
    );
  }
}