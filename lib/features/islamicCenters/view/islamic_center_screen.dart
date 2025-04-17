import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/copy_clipboard.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/islamicCenters/model/islamic_centers_model.dart';
import 'package:hiwayda_oracion_islamica/features/islamicCenters/view/countries_Screen.dart';
import '../../../core/widgets/custom_listTile.dart';
import '../controller/islamic_center_controller.dart';

class IslamicCenterScreen extends StatelessWidget {
  IslamicCenterScreen({super.key});

  final IslamicCenterController islamicCenterController =
      Get.put(IslamicCenterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kscandryGreen,
      appBar:const CustomAppbar(title: 'Islamic Centers',height: 85,),
      body: Obx(
        () => islamicCenterController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: islamicCenterController
                    .islamicCenterModel.countries!.length,
                itemBuilder: ((context, index) {
                  return CustomListTile(
                    index: index,
                    title: islamicCenterController
                        .islamicCenterModel.countries![index].countryName!,
                    onCopy: () async {
                      String textToCopy = "";

                      for (Centers center in islamicCenterController
                              .islamicCenterModel.countries![index].centers ??
                          []) {
                        textToCopy += center.toString();

                        textToCopy += "_____________________________\n";
                      }
                      copyToClipboard(textToCopy);
                    },
                    onTap: () {
                      Get.to(() => CountriesScreen(
                            countryIndex: index,
                          ));
                    },
                  );
                }),
              ),
      ),
    );
  }
}
