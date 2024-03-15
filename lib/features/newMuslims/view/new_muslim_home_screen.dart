import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/sections_widgets_home_screen.dart';

import '../../../core/constants/app_colors.dart';

class NewMuslimHomeScreen extends StatelessWidget {
  NewMuslimHomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
        title: const Text(
          "Equipaje del nuevo musulmán",
          style: Styles.textStyle18Godlen,
        ),
        backgroundColor: AppColors.kPrimaryColor,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SectionswidgetsHomeScreen(data: homeController.newMuslimHomeCardsData),
          ],
        ),
      ),
    );
  }
}
