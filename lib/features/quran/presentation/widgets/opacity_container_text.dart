import 'package:flutter/material.dart';

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';

class OpacityContainerText extends StatelessWidget {
  const OpacityContainerText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
        left: 12,
        right: 12,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
            color: AppColors.kGoldenColor, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
