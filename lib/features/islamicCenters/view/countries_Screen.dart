import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import '../../../core/widgets/custom_listTile.dart';
import '../controller/islamic_center_controller.dart';
import 'description_screen.dart';

class CountriesScreen extends StatelessWidget {
  CountriesScreen({required this.countryIndex, super.key});
  final int countryIndex;
  IslamicCenterController islamicCenterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${islamicCenterController.islamicCenterModel.countries![countryIndex].countryName}'),
      ),
      body: Container(
        color: AppColors.kPrimaryColor,
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
