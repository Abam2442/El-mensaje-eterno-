import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';

class AppBarCustom {
  final String title;
  final List<Widget>? actions;
  const AppBarCustom({
    required this.title,
    this.actions,
  });

  AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      centerTitle: true,
      actions: actions,
      iconTheme: const IconThemeData(
        color: AppColors.kGoldenColor,
      ),
      // leading: !Navigator.canPop(context)
      //     ? null
      //     : DirectionAware(
      //         // من شان تدوير الايقونة بزاوية 90
      //         //DirectionAware for rotate the icon to other side rtl or ltr
      //         child: IconButton(
      //           onPressed: () => Get.back(),
      //           icon: SvgPicture.asset(
      //             AppAssets.kBackIcon,
      //             color: AppColors.white,
      //           ),
      //         ),
      //       ),
      title: Text(
        title,
        style: const TextStyle(
            color: AppColors.kGoldenColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
