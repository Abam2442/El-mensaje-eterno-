import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam%20_religion/search/islam_religion_main_search.dart';
import '../../controller/islam_religion_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';
import 'islam_religion_contain_screen.dart';

class IslamReligionMainScreen extends StatelessWidget {
  const IslamReligionMainScreen({super.key});

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
                      controller.searchFun(val, controller.articals),
                      Get.to(() => const IslamReligionMainSearch())
                    },
                    formState: controller.formState,
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
