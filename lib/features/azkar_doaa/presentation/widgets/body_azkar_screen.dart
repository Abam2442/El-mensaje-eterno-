import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/handle_states_widget.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../../core/constants/app_pages_routes.dart';
import '../../../../core/widgets/primary_shimmer.dart';
import '../../domain/entities/azkar_entity.dart';

class BodyAzkarScreen extends GetView<AzkarDoaaController> {
  const BodyAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AzkarDoaaController>(
      init: AzkarDoaaController(),
      builder: (controller) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: HandleStatesWidget(
              stateType: controller.getAzkarState,
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
                child: Column(
                  children: [
                    ...List.generate(
                      controller.azkar.length,
                      (index) {
                        Azkar azkar = controller.azkar[index];
                        return PrimaryListTile(
                          onTap: () {
                            Get.toNamed(
                              AppPagesRoutes.contentAzkarDoaasScreen,
                              arguments: {
                                "label": "azkar",
                                "title": azkar.categoryNameEs ?? "",
                                "data": azkar.zikr,
                              },
                            );
                          },
                          es: azkar.categoryNameEs ?? "",
                          ar: '',
                          itemNumber: index + 1,
                          isSaved: false,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
