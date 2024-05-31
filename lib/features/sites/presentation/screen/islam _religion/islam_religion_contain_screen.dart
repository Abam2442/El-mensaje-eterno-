import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_religion_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam%20_religion/islam_religion_title_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam%20_religion/search/islam_religion_contain_search.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class IslamReligionContainScreen extends StatelessWidget {
  final int position;
  const IslamReligionContainScreen({
    super.key,
    required this.position,
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
                        controller.articals[position].catigory,
                      ),
                      Get.to(
                          () => IslamReligionContainSearch(position: position))
                    },
                    formState: controller.formState,
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount:
                            controller.articals[position].catigory.length,
                        itemBuilder: (context, index) {
                          return InkwellCustom(
                            catigory: false,
                            dataText: controller
                                .articals[position].catigory[index].name,
                            onTap: () {
                              Get.to(IslamReligionTitleScreen(
                                position: position,
                                positionSub: index,
                              ));
                            },
                          );
                        }),
                  ),
                ],
              )),
    );
  }
}
