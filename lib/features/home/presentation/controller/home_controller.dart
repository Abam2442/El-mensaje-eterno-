import 'dart:async';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_pages_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/jHijri.dart';
import 'package:location/location.dart' as locationPackage;

import '../../../../data/local/local_data.dart';

class HomeController extends GetxController {
  JHijri hijriNow = JHijri.now();
  DateTime now = DateTime.now().toLocal();

  List<HomeCardData> homeCardsData = [
    HomeCardData(
      title: "El Corán",
      description: "El libro sagrado de Al-láh",
      iconPath: AppAssets.quran,
      targetScreen: AppPagesRoutes.quranScreen,
    ),
    HomeCardData(
      title: " El Hadith",
      description: "Hadiths y dichos del Profeta",
      iconPath: AppAssets.hadith,
      targetScreen: AppPagesRoutes.hadithScreen,
    ),
    HomeCardData(
      title: "Equipaje del nuevo musulmán",
      description: "Aprende el nuevo musulmán en pasos ordenados.",
      iconPath: AppAssets.prayer,
      targetScreen: AppPagesRoutes.muslimScreen,
    ),
    HomeCardData(
      title: "La educación avanzada",
      description: "Lecciones avanzadas para el musulmán y el buscador de la verdad.",
      iconPath: AppAssets.azkar,
      targetScreen: AppPagesRoutes.advanced_learning,
    ),
  ];
  List<HomeCardData> newMuslimHomeCardsData = [
    HomeCardData(
      title: "La fe islámica",
      description: "El primer pilar del Islam",
      iconPath: AppSvgs.learnIslam,
      targetScreen: AppPagesRoutes.faithScreen,
    ),
    HomeCardData(
      title: "Pureza y las 5 oraciones",
      description: "El segundo pilar del Islam",
      iconPath: AppAssets.prayer,
      targetScreen: AppPagesRoutes.learnSalah,
    ),
    HomeCardData(
      title: "Ayunar, Zakat, Peregrinaje",
      description: "El resto de los pilares del Islam",
      iconPath: AppSvgs.pilers,
      targetScreen: AppPagesRoutes.pilersScreen,
    ),
    HomeCardData(
      title: "El día del nuevo musulmán",
      description: "Nuevas costumbres del musulmán",
      iconPath: AppSvgs.salahrokoa,
      targetScreen: AppPagesRoutes.mooamalatScreen,
    ),
    HomeCardData(
      title: "Moral y vida del nuevo musulmán",
      description: "Musulmán como debería ser",
      iconPath: AppSvgs.salahrokoa,
      targetScreen: AppPagesRoutes.newLifeScreen,
    ),
    HomeCardData(
      title: "Biografía del profeta Muhámmad",
      description: "Musulmán como debería ser",
      iconPath: AppSvgs.prophet,
      targetScreen: AppPagesRoutes.prophetScreen,
    ),
    HomeCardData(
      title: "Mezquitas y centros islámicos",
      description: "Lista de mezquitas por país",
      iconPath: AppSvgs.islamicCenters,
      targetScreen: AppPagesRoutes.islamicCenterScreen,
    ),
    HomeCardData(
      title: "Escuela para el nuevo musulmán",
      description: "Un plan de estudios integral para el nuevo musulmán",
      iconPath: AppSvgs.salahrokoa,
      targetScreen: AppPagesRoutes.newMuslimsCourseScreen,
    ),
    HomeCardData(
      title: "Azkar y Do'aa",
      description: "Las Suplicas diarias",
      iconPath: AppAssets.azkar,
      targetScreen: AppPagesRoutes.azkarDoaaScreen,
    ),
  ];

  String getHijriFormat() {
    return '${hijriNow.day}, ${enMonth(hijriNow.month)}, ${hijriNow.year}';
  }

  String enMonth(var month) {
    switch (month) {
      case 1:
        return "Muharram";
      case 2:
        return "Safar";
      case 3:
        return "Rabi' Al-Awwal";
      case 4:
        return "Rabi' Al-Thani";
      case 5:
        return "Jumada Al-Awwal";
      case 6:
        return "Jumada Al-Thani";
      case 7:
        return "Rajab";
      case 8:
        return "Sha'aban";
      case 9:
        return "Ramadan";
      case 10:
        return "Shawwal";
      case 11:
        return "Dhu Al-Qi'dah";
      case 12:
        return "Dhu Al-Hijjah";
      default:
        return "";
    }
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("H:m:s").format(now);
  }

  Timer? timer;

  @override
  void onInit() {
    selectedPage = 0.obs;
    pageController = PageController(initialPage: selectedPage.value);
    storedLocation = LocalData.getString('prayerTime');
    calcPrayerTimes();
    startTimer();
    Get.put(
      ArchiveService(sharedPreferencesService: Get.find()),
    );
    super.onInit();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      decrement();
    });
  }

  late RxInt selectedPage;
  RxBool isLoading = true.obs;
  late CalculationParameters params;
  late locationPackage.LocationData locationData;
  DateTime dateToCalc = DateTime.now();
  late Rx<String> fajrTime, duhurTime, asrTime, maghribTime, ishaTime;
  String? current;
  String? next;
  late final PageController pageController;

  JHijri nowHijri = JHijri.now();
  String? storedLocation;

  Rx<Duration> duration = Rx<Duration>(Duration.zero);

  void decrement() {
    var seconds = duration.value.inSeconds - 1;
    if (seconds <= 0) {
      //seconds = 0;
      if (AppPublicVar.coordinates != null) {
        calcTimes();
      }
      return;
    }
    duration.value = Duration(seconds: seconds);
  }

  late PrayerTimes prayerTimes;
  Rx<String> cityName = Rx<String>('');

  void setCityName(String name) {
    cityName.value = name;
  }

  void calcPrayerTimes() async {
    if (storedLocation == null) {
      locationPackage.Location location = locationPackage.Location();
      locationData = await location.getLocation();
      AppPublicVar.coordinates = Coordinates(locationData.latitude, locationData.longitude);
    } else {
      AppPublicVar.coordinates =
          Coordinates(double.parse(storedLocation!.split(':').first), double.parse(storedLocation!.split(':').last));
    }
    print('AppPublicVar.coordinates ${AppPublicVar.coordinates}');
    calcTimes();
    isLoading.value = false;
  }

  Future<void> calcTimes() async {
    params = CalculationMethod.UmmAlQura();
    params.madhab = Madhab.Shafi;
    prayerTimes = PrayerTimes(AppPublicVar.coordinates!, dateToCalc, params, precision: true);
    current = prayerTimes.currentPrayer(date: DateTime.now());
    next = prayerTimes.nextPrayer(date: DateTime.now());
    switch (next) {
      case 'fajr':
        duration.value = prayerTimes.fajr!.difference(DateTime.now());
        break;
      case 'dhuhr':
        duration.value = prayerTimes.dhuhr!.difference(DateTime.now());
        break;
      case 'asr':
        duration.value = prayerTimes.asr!.difference(DateTime.now());
        break;
      case 'maghrib':
        duration.value = prayerTimes.maghrib!.difference(DateTime.now());
        break;
      case 'isha':
        duration.value = prayerTimes.isha!.difference(DateTime.now());
        break;
      case 'fajrafter':
        duration.value = prayerTimes.fajrafter!.difference(DateTime.now());
        break;
    }
    saveData(AppPublicVar.coordinates!);
    fajrTime = DateFormat(('hh:mm a')).format(prayerTimes.fajr!.toLocal()).obs;
    duhurTime = DateFormat(('hh:mm a')).format(prayerTimes.dhuhr!.toLocal()).obs;
    asrTime = DateFormat(('hh:mm a')).format(prayerTimes.asr!.toLocal()).obs;
    maghribTime = DateFormat(('hh:mm a')).format(prayerTimes.maghrib!.toLocal()).obs;
    ishaTime = DateFormat(('hh:mm a')).format(prayerTimes.isha!.toLocal()).obs;
  }

  void saveData(Coordinates coordinates) async {
    await LocalData.setString('prayerTime', '${coordinates.latitude}:${coordinates.longitude}');
  }

  void changePage(int page) {
    //print(page);
    if (page < selectedPage.value) {
      now = now.subtract(Duration(days: 1));
      nowHijri = JHijri(fDate: now);
    } else {
      now = now.add(Duration(days: 1));
      nowHijri = JHijri(fDate: now);
    }
    prayerTimes = PrayerTimes(AppPublicVar.coordinates!, now, params, precision: true);
    selectedPage.value = page;
    update();
  }
}

class HomeCardData {
  final String title;
  final String description;
  final String iconPath;
  final String targetScreen;

  HomeCardData({
    required this.title,
    required this.description,
    required this.iconPath,
    required this.targetScreen,
  });
}
