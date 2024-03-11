import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/handle_states_widget.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../../core/constants/app_pages_routes.dart';
import '../../../../core/widgets/primary_shimmer.dart';
import '../../domain/entities/doaa_entity.dart';

class BodyDoaaScreen extends GetView<AzkarDoaaController> {
  const BodyDoaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DoaaLang? doaaLang;
    if (controller.doaas != null) {
      doaaLang = controller.doaas!.es;
    }
    return GetBuilder<AzkarDoaaController>(
      builder: (controller) => SingleChildScrollView(
        child: HandleStatesWidget(
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
            child: Column(
              children: [
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Etiquette of Supplication',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Evening remembrance supplications',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Incantations supplications',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Morning remembrance supplications',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Praises Allah Almighty',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Prophetic supplications',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Quranic Supplications',
                ),
                buildCustomListTile(
                  doaaLang?.etiquetteOfSupplication ?? [],
                  'Things that Prophet sought refuge [with Allah]',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomListTile(List data, String title) {
    return PrimaryListTile(
      onTap: () {
        Get.toNamed(
          AppPagesRoutes.contentAzkarDoaasScreen,
          arguments: {
            "label": "doaas",
            "title": title,
            "data": data,
          },
        );
      },
      itemName: title,
      itemNumber: 1,
      isSaved: false,
    );
  }
}
