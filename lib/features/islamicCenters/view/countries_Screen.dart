import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import '../../../core/widgets/custom_listTile.dart';
import '../controller/islamic_center_controller.dart';
import 'description_screen.dart';

class CountriesScreen extends StatelessWidget {
  CountriesScreen({required this.countryIndex, super.key});
  final int countryIndex;
  final IslamicCenterController islamicCenterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kscandryGreen,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.kGoldenColor,
        ),
        backgroundColor: AppColors.kPrimaryColor,
        title: Text(
          '${islamicCenterController.islamicCenterModel.countries![countryIndex].countryName}',
          style: Styles.textStyle20Golden,
        ),
      ),
      body: Container(
        color: AppColors.kscandryGreen,
        child: Padding(
            padding: 20.aEdge,
            child: ListView.builder(
                itemCount: islamicCenterController.islamicCenterModel
                    .countries![countryIndex].centers!.length,
                itemBuilder: (context, index) => CustomListTile(
                      index: index,
                      title: islamicCenterController.islamicCenterModel
                          .countries![countryIndex].centers![index].title!,
                      onTap: () {
                        Get.to(() => DescriptionScreen(
                              countryIndex: countryIndex,
                              centerIndex: index,
                            ));
                      },
                    ))),
      ),
    );
  }
}
