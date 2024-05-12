import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/handle_states_widget.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../../core/constants/app_pages_routes.dart';
import '../../../../core/widgets/primary_shimmer.dart';

class BodyDoaaScreen extends GetView<AzkarDoaaController> {
  const BodyDoaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DoaaLang? doaaLang;
    // if (controller.doaas != null) {
    //   doaaLang = controller.doaas!.es;
    // }
    return GetBuilder<AzkarDoaaController>(
      builder: (controller) => HandleStatesWidget(
        stateType: controller.getDoaaState,
        hasShimmer: true,
        shimmerChild: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          itemBuilder: (context, index) => PrimaryShimmer.rectangle(
            height: Get.height * 0.09,
            color: AppColors.kGreenColor,
            border: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          itemCount: 6,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: controller.doaas.length,
            itemBuilder: (c, i) {
              return buildCustomListTile(
                  controller.doaas[i].listOfDoaa,
                  controller.doaas[i].title,
                  controller.doaas[i].noOfPages.toString(),
                  i + 1);

              // const SizedBox(height: 20),
            },
          ),
        ),
      ),
    );
  }

  Widget buildCustomListTile(List data, String es, String ar, int item) {
    return PrimaryListTile(
      onTap: () {
        Get.toNamed(
          AppPagesRoutes.contentAzkarDoaasScreen,
          arguments: {
            "label": "doaas",
            "title": es,
            "data": data,
          },
        );
      },
      es: es,
      ar: ar,
      itemNumber: item,
      isSaved: false,
    );
  }
}
