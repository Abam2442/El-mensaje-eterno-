import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_religion_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam%20_religion/islam_religion_contain_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class IslamReligionMainSearch extends StatelessWidget {
  const IslamReligionMainSearch({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IslamReligionControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Religion").customAppBar(context),
      body: GetBuilder<IslamReligionControllerImp>(
          builder: (controller) => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: controller.searchResult.length,
                        itemBuilder: (context, index) {
                          return InkwellCustom(
                            catigory: false,
                            dataText: controller.searchResult[index].name,
                            onTap: () {
                              Get.to(IslamReligionContainScreen(
                                position: index,
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
