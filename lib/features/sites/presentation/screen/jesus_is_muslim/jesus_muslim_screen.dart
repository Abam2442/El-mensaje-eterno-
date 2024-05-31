import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/jesus_muslim_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_with_image.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/inkwell_custom.dart';

class JesusMuslimScreen extends StatelessWidget {
  const JesusMuslimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JesusMuslimControllerImp());
    return Scaffold(
      appBar:
          const AppBarCustom(title: "Jesus is muslim").customAppBar(context),
      body: GetBuilder<JesusMuslimControllerImp>(
          builder: (controller) => Column(
                children: [
                  SearchFieldWidget(
                      formState: controller.formState,
                      onSubmitted: (val) => {
                            controller.searchArticle(val, controller.articals),
                          }),
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: controller.articals.length,
                        itemBuilder: (context, index) {
                          return InkwellCustom(
                            catigory: false,
                            dataText: controller.articals[index].name,
                            onTap: () {
                              Get.to(
                                () => ArticalImageCustom(
                                  dataText: controller.articals[index].content,
                                  imageLink:
                                      controller.articals[index].imageLink,
                                ),
                              );
                            },
                          );
                        }),
                  ),
                ],
              )),
    );
  }
}
