import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_faith_controller.dart';
import '../widget/app_bar_custom.dart';
import '../widget/artical_custom.dart';
import '../widget/inkwell_custom.dart';

class IslamFaithScreen extends StatelessWidget {
  const IslamFaithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IslamFaithControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Islam Faith').customAppBar(context),
      body: GetBuilder<IslamFaithControllerImp>(
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
                        Get.to(ArticalCustom(
                            dataText: controller.articals[index].content));
                      },
                    );
                  }))),
    );
  }
}
