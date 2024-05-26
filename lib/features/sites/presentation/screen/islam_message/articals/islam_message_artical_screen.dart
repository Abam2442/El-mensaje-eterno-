import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_messages/islam_message_controller.dart';
import '../../../widget/app_bar_custom.dart';
import '../../../widget/inkwell_custom.dart';
import 'islam_message_artical_contain_screen.dart';

class IslamMessageArticalScreen extends StatelessWidget {
  const IslamMessageArticalScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: "Islam Message Artical")
          .customAppBar(context),
      body: GetBuilder<IslamMessageControllerImp>(
          builder: (controller) => controller.getArticalsState !=
                  StateType.success
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ListView.builder(
                      padding: const EdgeInsets.all(5),
                      itemCount: controller.articals.length,
                      itemBuilder: (context, index) {
                        return InkwellCustom(
                          catigory: false,
                          dataText: controller.articals[index].name,
                          onTap: () {
                            Get.to(IslamMessageContainArticalScreen(
                              itemCount:
                                  controller.articals[index].subCatigory.length,
                              dataText: controller.articals[index].subCatigory,
                            ));
                          },
                        );
                      }))),
    );
  }
}
