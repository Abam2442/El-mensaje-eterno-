import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/terminology_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/terminology/terminology_contain_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class TerminologySearch extends StatelessWidget {
  const TerminologySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Terminology').customAppBar(context),
      body: GetBuilder<TerminologyControllerImp>(builder: (controller) {
        if (controller.articals.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.searchResult.isEmpty) {
          return const Center(
            child: Text(
              "No se encontraron datos",
              style: TextStyle(fontSize: 16, color: AppColors.kPrimaryColor),
            ),
          );
        }

        return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: controller.searchResult.length,
            itemBuilder: (context, index) {
              return InkwellCustom(
                catigory: false,
                dataText: controller.searchResult[index].category,
                onTap: () {
                  Get.to(() => TerminologyContainScreen(
                        title: controller.articals[index].category,
                        dataText: controller.articals[index].data,
                        itemCount: controller.articals[index].data.length,
                      ));
                },
              );
            });
      }),
    );
  }
}
