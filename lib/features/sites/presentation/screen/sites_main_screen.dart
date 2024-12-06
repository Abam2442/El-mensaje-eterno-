import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/sites_controller.dart';
import '../widget/app_bar_custom.dart';
import '../widget/artical_custom.dart';
import '../widget/inkwell_custom.dart';

class SitesMainScreen extends StatelessWidget {
  final String fileName, sectionName;
  const SitesMainScreen(
      {super.key, required this.fileName, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    Get.put(SitesController(fileName, sectionName));
    return Scaffold(
      appBar: const AppBarCustom(title: 'Bidaa in islam').customAppBar(context),
      body: GetBuilder<SitesController>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.articals.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.articals[index].name,
                      onTap: () {
                        Get.to(ArticalCustom(
                          dataText: controller.articals[index].content,
                        ));
                      },
                    );
                  }))),
    );
  }
}
