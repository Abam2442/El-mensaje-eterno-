import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/saber_el_islam_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class SaberElIslamSearch extends StatelessWidget {
  const SaberElIslamSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Saber El Islam').customAppBar(context),
      body: GetBuilder<SaberElIslamControllerImp>(builder: (controller) {
        if (controller.articals.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: controller.searchResult.length,
                itemBuilder: (context, index) {
                  return InkwellCustom(
                    catigory: false,
                    dataText: controller.searchResult[index].title,
                    onTap: () {
                      Get.to(() => ArticalCustom(
                            dataText: controller.searchResult[index].artical,
                          ));
                    },
                  );
                }));
      }),
    );
  }
}
