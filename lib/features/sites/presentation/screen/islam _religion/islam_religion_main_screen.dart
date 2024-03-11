import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.articals.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.articals[index].name,
                      onTap: () {
                        Get.to(IslamReligionContainScreen(
                          itemCount: controller.articals[index].catigory.length,
                          dataText: controller.articals[index].catigory,
                        ));
                      },
                    );
                  }))),
    );
  }
}
