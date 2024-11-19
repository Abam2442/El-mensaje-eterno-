import 'dart:convert';
import 'dart:developer';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_pages_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/services/archive_service.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/test_model.dart';
import 'package:intl/intl.dart';
// import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import '../../../../data/local/local_data.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();
  RxList<HomeCardData> newMuslimHomeCardsDataNewList = <HomeCardData>[].obs;

  final List<HomeCardData> searchResult = [];
  var todayDate = DateTime.now();
  late var formattedDate;
  final String apiLink = 'https://api.aladhan.com/v1/timings';
  // Location location = new Location();
  String locationMessage = "Getting location...";
  TestModel timingsData = TestModel(hijriDate: '', timings: {});

  // late LocationData _locationData;
  Future<void> getData() async {
    try {
      final data = await http.get(Uri.parse(
          '$apiLink/$formattedDate?latitude=${_position.latitude}&longitude=${_position.longitude}'));

      final finalData = json.decode(data.body);

      timingsData = TestModel.fromJson(finalData);
      update();

      print(timingsData.hijriDate);
      print(timingsData.timings);
    } catch (e) {
      print(e);
    }
  }

  // Future<void> _getCurrentLocation() async {
  //   try {
  //     bool _serviceEnabled;
  //     PermissionStatus _permissionGranted;

  //     _serviceEnabled = await location.serviceEnabled();
  //     if (!_serviceEnabled) {
  //       _serviceEnabled = await location.requestService();
  //     }

  //     _permissionGranted = await location.hasPermission();
  //     if (_permissionGranted == PermissionStatus.denied) {
  //       _permissionGranted = await location.requestPermission();
  //     }

  //     _locationData = await location.getLocation();
  //     log(_locationData.toString());
  //     // update();
  //     // _locationData;
  //     locationMessage =
  //         "Latitude: ${_locationData.latitude}, Longitude: ${_locationData.longitude}";
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void search(String query) {
    final result = newMuslimHomeCardsData
        .where((element) => element.title.contains(query))
        .toList();
    print(result);
    searchResult.assignAll(result);
  }

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
  ];

  late Position _position;

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationMessage = "Location permissions are denied.";
        update();
        return;
      }
    }
    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationMessage = "Location services are disabled.";
      await Geolocator.openLocationSettings();
      update();
      // return;
    }

    if (permission == LocationPermission.deniedForever) {
      locationMessage = "Location permissions are permanently denied.";
      update();
      return;
    }

    // When permissions are granted, get the position of the device
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    _position = position;

    locationMessage =
        "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    log(locationMessage);
    update();
  }

  @override
  void onInit() async {
    newMuslimHomeCardsDataNewList = newMuslimHomeCardsData.obs;
    formattedDate = DateFormat('dd-MM-yyyy').format(todayDate);
    await _getCurrentLocation();
    await getData();
    Get.put(
      ArchiveService(sharedPreferencesService: Get.find()),
    );
    super.onInit();
  }

  void saveData(Coordinates coordinates) async {
    await LocalData.setString(
        'prayerTime', '${coordinates.latitude}:${coordinates.longitude}');
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
