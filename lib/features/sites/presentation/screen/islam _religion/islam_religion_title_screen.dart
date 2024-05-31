import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_religion_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam%20_religion/search/islam_religion_title_search.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class IslamReligionTitleScreen extends StatelessWidget {
  final int position, positionSub;
  const IslamReligionTitleScreen({
    super.key,
    required this.position,
    required this.positionSub,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(IslamReligionControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Religion").customAppBar(context),
      body: GetBuilder<IslamReligionControllerImp>(
          builder: (controller) => Column(
                children: [
                  SearchFieldWidget(
                    onSubmitted: (val) => {
                      controller.searchFun(
                          val,
                          controller.articals[position].catigory[positionSub]
                              .subCatigory),
                      Get.to(() => IslamReligionTitleSearch(
                            position: position,
                            positionSub: positionSub,
                          ))
                    },
                    formState: controller.formState,
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: controller.articals[position]
                            .catigory[positionSub].subCatigory.length,
                        itemBuilder: (context, index) {
                          return InkwellCustom(
                            catigory: false,
                            dataText: controller.articals[position]
                                .catigory[positionSub].subCatigory[index].name,
                            onTap: () {
                              Get.to(ArticalCustom(
                                  dataText: controller
                                      .articals[position]
                                      .catigory[positionSub]
                                      .subCatigory[index]
                                      .content));
                            },
                          );
                        }),
                  ),
                ],
              )),
    );
  }
}
