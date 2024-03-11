import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/home_card.dart';

import '../../../../core/constants/app_colors.dart';
import '../controller/home_controller.dart';

class SectionswidgetsHomeScreen extends StatelessWidget {
  SectionswidgetsHomeScreen({
    super.key,
  });

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      decoration: const BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(children: [
        ...List.generate(
          homeController.homeCardsData.length,
          (index) => HomeCard(
            homeCardData: homeController.homeCardsData[index],
          ),
        ),
      ]),
    );
  }
}
