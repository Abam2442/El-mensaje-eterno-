import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';

import '../../controller/saber_el_islam_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';
import 'saber_el_islam_artical_list.dart';

class SaberElIslamScreen extends StatelessWidget {
  const SaberElIslamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SaberElIslamControllerImp());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppBarCustom(title: 'Saber El Islam').customAppBar(context),
      body: GetBuilder<SaberElIslamControllerImp>(builder: (controller) {
        if (controller.articals.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            SearchFieldWidget(
              text: 'Buscar en artículos',
              formState: controller.formState,
              onSubmitted: (val) => controller.searchFun(val),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.articals.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.articals[index].name,
                      onTap: () {
                        Get.to(() => SaberElIslamArticalListScreen(
                              articals: controller.articals[index].articals,
                              name: controller.articals[index].name,
                            ));
                      },
                    );
                  }),
            ),
          ],
        );
      }),
    );
  }
}
