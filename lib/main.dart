import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/data/local/local_data.dart';
import 'package:hiwayda_oracion_islamica/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_themes.dart';
import 'package:hiwayda_oracion_islamica/core/ys_localizations/ys_localizations.dart';
import 'package:hiwayda_oracion_islamica/core/ys_localizations/ys_localizations_provider.dart';
import 'package:hiwayda_oracion_islamica/core/ys_localizations/ys_material_app.dart';
import 'package:hiwayda_oracion_islamica/data/remote/remote_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  Get.put(pref);
  initLang();
  await LocalData.init();
  await YsLocalizations.init();
  runApp(const MyApp());
}

void initLang() {
  // String? sharedPrefLang = Get.find<SharedPreferences>().getString(AppKeys.lang);
  ThemeData appTheme = AppThemes.themeEnglish;
  Locale language = const Locale("en");
  appTheme = AppThemes.themeEnglish;
  // if (sharedPrefLang == "ar") {
  //   language = const Locale("ar");
  //   appTheme = AppThemes.themeArabic;
  // } else if (sharedPrefLang == "en") {
  //   language = const Locale("en");
  //   appTheme = AppThemes.themeEnglish;
  // } else {
  //   language = Locale(Get.deviceLocale!.languageCode);
  //   if (Get.deviceLocale!.languageCode == "ar") {
  //     appTheme = AppThemes.themeArabic;
  //   } else if (Get.deviceLocale!.languageCode == "en") {
  //     appTheme = AppThemes.themeEnglish;
  //   }
  // }
  Get.put(language);
  Get.put(appTheme);
  // Get.find<SharedPreferences>().setString(AppKeys.lang, Get.deviceLocale!.languageCode);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => YsLocalizationsProvider()),
        ChangeNotifierProvider(create: (context) => RemoteData()),
      ],
      child: const YsMaterialApp(
        title: 'El Mensaje Eterno',
        home:
            //TestConnection()
            SplashPage(),
        //PrayerTimesPage()
        //LearnSalah()
        //FajrPracticalPage()
        //const PracticalLearnPage()
        //const HomePage(),
      ),
    );
  }
}
/*
keytool -genkey -v -keystore C:\Users\Asus\AndroidStudioProjects\Flutter\current\islamic\salah\android\app\upload-keystore.jks ^
        -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 ^
        -alias upload

 */
