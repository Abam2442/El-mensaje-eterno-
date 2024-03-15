import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/home_card.dart';

import '../../../../core/constants/app_colors.dart';
import '../controller/home_controller.dart';

class SectionswidgetsHomeScreen extends StatelessWidget {
  final List<HomeCardData> data;

  const SectionswidgetsHomeScreen({
    super.key,
    required this.data,
  });

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
          data.length,
          (index) => HomeCard(
            homeCardData: data[index],
          ),
        ),
      ]),
    );
  }
}
