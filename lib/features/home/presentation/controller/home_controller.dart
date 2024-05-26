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
  RxList<HomeCardData> newMuslimHomeCardsDataNewList = <HomeCardData>[].obs;

  void filterNewMuslimHomeCardsData(String searchText) {
    newMuslimHomeCardsDataNewList.clear();
    for (var element in newMuslimHomeCardsData) {
      if (searchText.isEmpty) {
        newMuslimHomeCardsDataNewList.add(element);
      } else {
        if (element.description.contains(searchText) ||
            element.title.contains(searchText)) {
          newMuslimHomeCardsDataNewList.add(element);
        }
      }
    }
  }

  //Searching
  var isSearching = false.obs;
  var searchTextController = TextEditingController();
  var searchFocusNode = FocusNode();
  List<HomeCardData> homeCardsData = [
    HomeCardData(
      title: "El Corán Sagrado",
      link: 'https://quran.com',
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
      giude:
          "Contiene varias traducciones diferentes de los significados del Sagrado Corán en español.\n Es importante señalar que todas estas traducciones son traducciones humanas.  El Corán se basa únicamente en la revelación original en idioma árabe, y todas estas traducciones se realizaron para facilitar la comprensión del Corán a los no árabes, pero estas traducciones aún están incompletas y contienen errores porque son humanas. hecho.",
      description: "Traducción de los significados del Corán",
      iconPath: AppAssets.quran,
      targetScreen: AppPagesRoutes.quranScreen,
    ),
    HomeCardData(
      title: "Los nobles Hadices",
      giude:
          'Contiene los dichos, hadices y hechos del profeta Muhammad .  Se considera la segunda fuente de revelación para los musulmanes, proviene de Dios y fue hablada por el Profeta.\n\n Hay una diferencia entre este y el Corán, y es que Dios ha prometido preservar todo el Corán, por lo que no contiene errores.\n Si bien los hadices, algunos de los cuales son auténticos, en realidad fueron dichos por el Profeta\n Entre ellos está lo que es falso y no fue dicho por el Profeta, sino inventado por algunos mentirosos, y entre los hadices está lo que se encuentra entre estos dos niveles.\n\n A través de la ciencia de la terminología de los hadices, se conoce la autenticidad de cada hadiz, lo cual es un asunto complejo.\n\n Pero hay que señalar que entre los hadices que se han colocado aquí hay hadices 100% auténticos dichos por el Profeta, y hay hadices que son de menor grado que ellos.',
      description: "Dichos del Profeta ﷺ (La Segunda Revelación)",
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
      link: 'https://www.Hadithenc.com',
      iconPath: AppAssets.hadith,
      targetScreen: AppPagesRoutes.hadithScreen,
    ),
    HomeCardData(
      title: "Equipaje del nuevo musulmán",
      // link: 'https://www.newmuslimguide.com',
      // copyRight:
      //     'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
      giude:
          'Contiene los primeros pasos para el nuevo musulmán, comenzando con pronunciar el testimonio de fe y abrazando el Islam, luego explicando la sana doctrina islámica, luego explicando los pilares del Islam, explicando cómo orar, luego explicando los buenos ajustes en el ámbito social y moral. vida de un musulmán, cómo tratar a tus padres, a tus hijos, a tu marido o a tu esposa, cómo comer y beber, cómo tratar a las personas, transacciones financieras y otros asuntos.\n Y cambios morales mediante la enseñanza de valores islámicos.\n Luego explicó aspectos de la vida del Profeta, la paz y las bendiciones de Al-lah sean con él \n También hay una sección de súplicas diarias para todos los asuntos de la vida.\n\n Debes aprender paso a paso.\n\n🌷✨Lo más importante que aprendes es la creencia, que es el primero de los cinco pilares del Islam, luego aprendes las 5 oraciones, que es el segundo de los cinco pilares del Islam, y es lo más importante que puede hacer un musulmán. .\n\n Después de eso, aprenderá los tres pilares restantes a intervalos junto con el resto de las otras lecciones, como la moral, las transacciones y otros asuntos.',
      description: "Aprende el nuevo musulmán en pasos ordenados.",
      iconPath: AppAssets.prayer,
      targetScreen: AppPagesRoutes.muslimScreen,
    ),
    HomeCardData(
      title: "La educación avanzada",
      description:
          "Lecciones avanzadas para el musulmán y el buscador de la verdad.",
      giude:
          'Esta sección está dirigida al musulmán que ha completado las lecciones anteriores y desea aprender más. Aquí encontrará muchas, muchas enciclopedias, lecciones y clips que necesita.\n\n Además, esta sección está dirigida a los no musulmanes que buscan la verdad, ya que hay muchas cosas que les ayudarán.',
      iconPath: AppAssets.azkar,
      targetScreen: AppPagesRoutes.advanced_learning,
    ),
  ];
  List<HomeCardData> newMuslimHomeCardsData = [
    HomeCardData(
      title: "La fe islámica",
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
      description: "El primer pilar del Islam",
      link: 'https://newmuslimguide.com',
      iconPath: AppSvgs.learnIslam,
      targetScreen: AppPagesRoutes.faithScreen,
    ),
    HomeCardData(
      title: "Pureza y las 5 oraciones",
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
      link: 'https://Al-feqh.com',
      description: "El segundo pilar del Islam",
      iconPath: AppAssets.prayer,
      targetScreen: AppPagesRoutes.learnSalah,
    ),
    HomeCardData(
      title: "Ayunar, Zakat, Peregrinaje",
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original ',
      description: "El resto de los pilares del Islam",
      link: 'https://Al-feqh.com',
      iconPath: AppSvgs.pilers,
      targetScreen: AppPagesRoutes.pilersScreen,
    ),
    HomeCardData(
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original ',
      link: 'https://newmuslimguide.com',
      title: "El día del nuevo musulmán",
      description: "Nuevas costumbres del musulmán",
      iconPath: AppSvgs.salahrokoa,
      targetScreen: AppPagesRoutes.mooamalatScreen,
    ),
    HomeCardData(
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original ',
      link: 'https://newmuslimguide.com',
      title: "Moral y vida del nuevo musulmán",
      description: "Musulmán como debería ser",
      iconPath: AppSvgs.salahrokoa,
      targetScreen: AppPagesRoutes.newLifeScreen,
    ),
    HomeCardData(
      title: "Biografía del profeta Muhámmad",
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
      link: '',
      description:
          "La Sunnah del Profeta y las sectas corruptas que la contradicen",
      iconPath: AppSvgs.prophet,
      targetScreen: AppPagesRoutes.prophetScreen,
    ),
    HomeCardData(
      title: "Mezquitas y centros islámicos",
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
      description: "Lista de mezquitas por país",
      link: 'https://islammessage.org/sp/centers',
      iconPath: AppSvgs.islamicCenters,
      targetScreen: AppPagesRoutes.islamicCenterScreen,
    ),
    HomeCardData(
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
      link: 'https://newmuslims.com',
      title: "Escuela para el nuevo musulmán",
      description: "Un plan de estudios integral para el nuevo musulmán",
      iconPath: AppSvgs.salahrokoa,
      targetScreen: AppPagesRoutes.newMuslimsCourseScreen,
    ),
    HomeCardData(
      title: "Azkar y Do'aa",
      copyRight:
          'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
      link: 'https://doa.eqtidaa.com',
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
    newMuslimHomeCardsDataNewList = newMuslimHomeCardsData.obs;
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
      AppPublicVar.coordinates =
          Coordinates(locationData.latitude!, locationData.longitude!);
    } else {
      AppPublicVar.coordinates = Coordinates(
          double.parse(storedLocation!.split(':').first),
          double.parse(storedLocation!.split(':').last));
    }
    print('AppPublicVar.coordinates ${AppPublicVar.coordinates}');
    calcTimes();
    isLoading.value = false;
  }

  Future<void> calcTimes() async {
    params = CalculationMethod.ummAlQura();
    params.madhab = Madhab.shafi;
    prayerTimes = PrayerTimes(
        precision: true,
        date: dateToCalc,
        coordinates: AppPublicVar.coordinates!,
        calculationParameters: params);
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
    duhurTime =
        DateFormat(('hh:mm a')).format(prayerTimes.dhuhr!.toLocal()).obs;
    asrTime = DateFormat(('hh:mm a')).format(prayerTimes.asr!.toLocal()).obs;
    maghribTime =
        DateFormat(('hh:mm a')).format(prayerTimes.maghrib!.toLocal()).obs;
    ishaTime = DateFormat(('hh:mm a')).format(prayerTimes.isha!.toLocal()).obs;
  }

  void saveData(Coordinates coordinates) async {
    await LocalData.setString(
        'prayerTime', '${coordinates.latitude}:${coordinates.longitude}');
  }

  void changePage(int page) {
    //print(page);
    if (page < selectedPage.value) {
      now = now.subtract(const Duration(days: 1));
      nowHijri = JHijri(fDate: now);
    } else {
      now = now.add(const Duration(days: 1));
      nowHijri = JHijri(fDate: now);
    }
    prayerTimes = PrayerTimes(
        precision: true,
        date: now,
        coordinates: AppPublicVar.coordinates!,
        calculationParameters: params);
    selectedPage.value = page;
    update();
  }
}

class HomeCardData {
  final String title;
  final String? giude;
  final String? copyRight;
  final String? link;
  final String description;
  final String iconPath;
  final String targetScreen;

  HomeCardData({
    required this.title,
    this.giude,
    this.link,
    this.copyRight,
    required this.description,
    required this.iconPath,
    required this.targetScreen,
  });
}
