import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_list_tile.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/sunnah_widgets/sunnah_last_data_screen.dart';

class SunnahJsonDataScreen extends StatelessWidget {
  const SunnahJsonDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HadithController controller = HadithController.instance;
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.sunnahJsonData.length,
        itemBuilder: (context, index) {
          return PrimaryListTile(
            itemNumber: index + 1,
            es: controller.sunnahJsonData[index].head,
            ar: '',
            isSaved: false,
            onTap: () {
              Get.to(() => SunnahLastDataScreen(
                    data: controller.sunnahJsonData[index],
                  ));
            },
          );
        },
      ),
    );
  }
}
