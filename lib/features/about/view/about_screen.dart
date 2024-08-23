import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/about/controller/about_controller.dart';
import 'package:hiwayda_oracion_islamica/features/about/view/widget/developer_card.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.kGoldenColor, //change your color here
          ),
          backgroundColor: AppColors.kPrimaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                  child: Text('Developers', style: Styles.textStyle24Golden)),
              SvgPicture.asset(AppAssets.logoApp)
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: const BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              ...List.generate(
                controller.developerData.length,
                (index) => DeveloperCard(
                  developerModel: controller.developerData[index],
                ),
              ),
            ]),
          ),
        ));
  }
}
