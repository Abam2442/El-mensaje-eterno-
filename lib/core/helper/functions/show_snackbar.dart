import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/navigation_service.dart';
import 'package:hiwayda_oracion_islamica/core/ys_localizations/ys_localizations_provider.dart';

showSnackbar(String message, {bool error = false}) {
  closeSnackbar();
  final locale =
      YsLocalizationsProvider.listenFalse(NavigationService.currentContext);
  ScaffoldMessenger.of(NavigationService.currentContext).showSnackBar(
    SnackBar(
      backgroundColor: Colors.amberAccent,
      content: Text(
        message,
        style: AppTextStyles.h5,
        textDirection:locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      ),
      // backgroundColor: error ? AppColors.yRedColor : AppColors.yGreenColor,
    ),
  );
}

closeSnackbar() {
  ScaffoldMessenger.of(NavigationService.currentContext).clearSnackBars();
}
