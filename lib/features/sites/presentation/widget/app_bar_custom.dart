import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class AppBarCustom {
  final String title;
  const AppBarCustom({
    required this.title,
  });

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
            color: AppColors.kGoldenColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
