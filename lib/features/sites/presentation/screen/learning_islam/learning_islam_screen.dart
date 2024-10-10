import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/learning_islam_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';
import 'learning_contain_screen.dart';

class LearningIslamScreen extends StatelessWidget {
  const LearningIslamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LearningIslamControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: "Learning Islam").customAppBar(context),
      body: GetBuilder<LearningIslamControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.articals.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.articals[index].name,
                      onTap: () {
                        Get.to(LearningContainScreen(
                            dataText: controller.articals[index].subCatigory,
                            itemCount:
                                controller.articals[index].subCatigory.length,
                            onTap: controller.articals[index].subCatigory));
                      },
                    );
                  }))),
    );
  }
}
