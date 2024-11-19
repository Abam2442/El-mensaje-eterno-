import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/copy_button.dart';

import '../controller/islamic_center_controller.dart';

class DescriptionScreen extends StatelessWidget {
  DescriptionScreen(
      {required this.countryIndex, required this.centerIndex, super.key});
  final int countryIndex;
  final int centerIndex;
  IslamicCenterController islamicCenterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text(
                  '${islamicCenterController.islamicCenterModel.countries![countryIndex].centers![centerIndex].title}'),
            ),
            actions: [
              CopyButton(
                  text: islamicCenterController.islamicCenterModel
                      .countries![countryIndex].centers![centerIndex]
                      .toString()),
            ]),
        backgroundColor: AppColors.kPrimaryColor,
        body: SingleChildScrollView(
          child: Padding(
              padding: 10.aEdge,
              child: Column(
                children: [
                  SelectableText(
                    '${islamicCenterController.islamicCenterModel.countries![countryIndex].centers![centerIndex].description} \n ${islamicCenterController.islamicCenterModel.countries![countryIndex].centers![centerIndex].address}',
                    style: Styles.textStyle18Godlen,
                  ),
                ],
              )),
        ));
  }
}
