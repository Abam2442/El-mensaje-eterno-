import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_land_books_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/external_links_list_view.dart';
import '../../controller/islam_land_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';

class IslamLandBooksMainScreen extends GetView<IslamLandBooksControllerImp> {
  const IslamLandBooksMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Land").customAppBar(context),
      body: GetBuilder<IslamLandBooksControllerImp>(builder: (controller) {
        if (controller.getDataState == StateType.loading) {
          return Center(
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
                    catigory: true,
                    dataText: controller.data.keys.elementAt(index),
                    onTap: () {
                      final name = controller.data.keys.elementAt(index);
                      Get.to(ExternalLiksListView(
                        title: name,
                        data: controller.data[name] ?? [],
                      ));
                    },
                  );
                }));
      }),
    );
  }
}
