import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/helper/functions/navigation_service.dart';
import 'package:hiwayda_oracion_islamica/core/ys_localizations/ys_localizations.dart';
import 'package:hiwayda_oracion_islamica/core/ys_localizations/ys_localizations_provider.dart';

import '../../intial_bindings.dart';
import '../constants/app_pages_routes.dart';

class YsMaterialApp extends StatelessWidget {
  const YsMaterialApp({
    super.key,
    this.title = '',
    this.theme,
    this.darkTheme,
    this.home,
  });
  final String title;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final Widget? home;

  @override
  Widget build(BuildContext context) {
    final locale = YsLocalizationsProvider.get(context);
    return ScreenUtilInit(
        builder: (_, __) => GetMaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      locale: Locale(locale.languageCode),
      supportedLocales: YsLocalizations.supportedLocale,
      localizationsDelegates: YsLocalizations.localizationsDelegates,
      localeResolutionCallback: YsLocalizations.localeResolutionCallback,
      title: title,
      theme: theme,
      darkTheme: darkTheme,
          builder: EasyLoading.init(),
      initialBinding: InitialBindings(),
      home: home,
      getPages: AppPagesRoutes.appPages,
    ));
  }
}
