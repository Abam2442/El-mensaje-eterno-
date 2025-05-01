import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_land/islam_land_books_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';

class IslamLandBooksMainScreen extends GetView<IslamLandBooksControllerImp> {
  const IslamLandBooksMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Islam Land Books").customAppBar(context),
      body: GetBuilder<IslamLandBooksControllerImp>(builder: (controller) {
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
                    // iconData: controller.icons[index],
                    catigory: false,
                    dataText: controller.data.keys.elementAt(index),
                    onTap: () {
                      final name = controller.data.keys.elementAt(index);
                      // Get.to(MediaFilesListView(
                      //   title: name,
                      //   data: controller.data[name] ?? [],
                      //   fileType: 'pdf',
                      //   mediaLinkType: MediaLinkType.downloadOnly,
                      //   usePaginator:
                      //       (controller.data[name]?.length ?? 0) >= 40,
                      // ));
                    },
                  );
                }));
      }),
    );
  }
}
