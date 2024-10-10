import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/sunnah_widgets/custom_item_card.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/sunnah_widgets/sunnah_json_data_screen.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/sunnah_widgets/sunnah_pdf_data_screen.dart';

class BodyHadithencScreen extends GetView<HadithController> {
  const BodyHadithencScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HadithController controller = HadithController.instance;
    return ListView.builder(
        itemCount: controller.sunnahData.length,
        itemBuilder: (context, index) {
          return CustomItemCard(
            titleSite: controller.sunnahData[index].title,
            subtitle: controller.sunnahData[index].subTitle,
            onPress: () async {
              if (controller.sunnahData[index].extenstion == 'pdf') {
                Get.to(() => SunnahPdfDataScreen(
                      path: controller.sunnahData[index].filePath,
                    ));
              } else {
                await controller
                    .getSunnah(controller.sunnahData[index].filePath);
                Get.to(() => const SunnahJsonDataScreen());
              }
            },
          );
        });
  }
}
