// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_pages_routes.dart';

class AdvancedLearningController extends GetxController {
  static AdvancedLearningController get instance =>
      Get.find<AdvancedLearningController>();
  int selectedPart = 0;
  changeSelectedPart(val) {
    selectedPart = val;

    update();
  }

  List titlePart = [
    'El buscador de la verdad',
    'Enciclopedias islámicas',
    'AL-LÁH y su mensajero',
    'Guía al islam',
    'Temas islámicos',
    'Medios de comunicación',
    "Azkar y Do'aa"
  ];
  //  HomeCardData(
  //     title: "Azkar y Do'aa",
  //     copyRight:
  //         'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
  //     link: 'https://doa.eqtidaa.com',
  //     description: "Las Suplicas diarias",
  //     iconPath: AppAssets.azkar,
  // targetScreen: AppPagesRoutes.azkarDoaaScreen,
  //   ),

  List<List<Map>> page = [
    //1
    [
      {
        "title": "¿Qué es el Islam?",
        "description": "Los Fundamentos del Islam",
        "targetScreen": AppPagesRoutes.nonMuslimTopicsScreen,
      },
      {
        "title": "Cristianismo",
        "description": "La corrupción de la Biblia",
        "targetScreen": AppPagesRoutes.nonMuslimTopicsScreen,
      },
      {
        "title": "El Islam es la religión de verdad",
        "description": "Pruebas de existencia de Dios",
        "targetScreen": AppPagesRoutes.nonMuslimTopicsScreen,
      },
      {
        "title": "Objeciones sobre el Islam",
        "description": "Dudas sobre el Islam",
        "targetScreen": AppPagesRoutes.nonMuslimTopicsScreen,
      },
      {
        "title": "Preguntas sobre el Islam",
        "description": "temas islámicos",
        "targetScreen": AppPagesRoutes.nonMuslimTopicsScreen,
      },
      {
        "title": "Responder a las sectas",
        "description": "Learn more about sectas",
        "targetScreen": AppPagesRoutes.nonMuslimTopicsScreen,
      },
    ],
    //2
    [
      {
        "title": "Islam Land (Tierra del Islam)",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.Islamland.com',
        "description": "Contenido islámico integrado",
        "targetScreen": AppPagesRoutes.islamLand,
      },
      {
        "title": "Islam Religion",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.Islamreligion.com',
        "description": "Contenido islámico integrado",
        "targetScreen": AppPagesRoutes.islamReligion,
      },
      {
        "title": "Islam Messege (Mensaje del Islam)",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.Islammessage.org',
        "description": "Contenido islámico integrado",
        "targetScreen": AppPagesRoutes.islamMessage,
      },
      {
        "title": "Islam House (Casa del Islam)",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.Islamhouse.com',
        "description": "Contenido islámico integrado",
        "targetScreen": AppPagesRoutes.islamHouse,
      },
    ],
    //3
    [
      {
        "title": "Knowing Allah (Conociendo a Al-láh)",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.knowingallah.com',
        "description": "sobre nuestra creencia en Dios",
        "targetScreen": AppPagesRoutes.knowingAllah,
      },
      {
        "title": "Rasoul Al-lah (el Mensajero de Al-láh)",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.rasoulallah.net',
        "description": "sobre el profeta Muhammad ﷺ",
        "targetScreen": AppPagesRoutes.rasulullah,
      },
      {
        "title": "Muhammed ﷺ el Mensajero de Dios",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.pbuh.us',
        "description": "sobre el profeta Muhammad ﷺ",
        "targetScreen": AppPagesRoutes.muhammadTheMessangerOfGod,
      },
      {
        "title": "Jesús es musulmán",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.jesus-is-muslim.net',
        "description": "sobre el profeta Jesús la paz sea con él",
        "targetScreen": AppPagesRoutes.jesusIsMuslim,
      },
      {
        "title": "Jesús y el Corán",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original ',
        "link": 'http://www.jesusandquran.com',
        "description": "sobre profeta Jesús la paz sea con él",
        "targetScreen": AppPagesRoutes.jesusInQuran,
      },
      {
        "title": "Islam por cristianos",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.islamforchristians.com',
        "description": "entre el Islam y el cristianismo",
        "targetScreen": AppPagesRoutes.islamForChristians,
      },
    ],
    //4
    [
      {
        "title": "Guía del Islam (La Verdad Clara)",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'https://www.islam-guide.com',
        "description": "Por qué el Islam es la verdad",
        "targetScreen": AppPagesRoutes.islamGuide1,
      },
      {
        "title": "Guía al Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'https://www.guidetoislam.com',
        "description": "Una explicación del Islam",
        "targetScreen": AppPagesRoutes.guideToIslam,
      },
      {
        "title": "Saber el islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'https://www.Saberislam.com',
        "description": "Una explicación sobre el Islam",
        "targetScreen": AppPagesRoutes.saberElIslam,
      },
      {
        "title": "la fe islámica",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original ',
        "link": 'https://www.the-faith.com',
        "description": "sobre nuestra creencia",
        "targetScreen": AppPagesRoutes.islamFaith,
      },
      {
        "title": "Clave para el Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'https://www.thekeytoislam.com',
        "description": "Una explicación del Islam",
        "targetScreen": AppPagesRoutes.theKeyToIslam,
      },
      {
        "title": "Clave del Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'https://www.the-faith.com',
        "description": "Una explicación del Islam",
        "targetScreen": AppPagesRoutes.theKeyToIslam2,
      },
      {
        "title": "El mensaje del Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://themessageofislam.org',
        "description": "Una explicación del Islam",
        "targetScreen": AppPagesRoutes.messageOfIslam,
      },
      {
        "title": "Universo Islámico",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://islamuniverse.org',
        "description": "Una explicación del Islam",
        "targetScreen": AppPagesRoutes.islamUniverse,
      },
      {
        "title": "Explorar el Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'https://explore-islam.com',
        "description": "Una explicación del Islam",
        "targetScreen": AppPagesRoutes.exploreIslam,
      },
      {
        "title": "Puerto Islámico",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://islam-port.com',
        "description": "Una explicación del Islam",
        "targetScreen": AppPagesRoutes.islamPort,
      },

      // {
      //   "title": "Islam guide_2",
      //   "description": "Learn more about islam",
      //   "targetScreen": AppPagesRoutes.quranScreen,
      // },
    ],
    //5
    [
      {
        "title": "Religión de paz",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": '',
        "description": "La verdad sobre el Islam",
        "targetScreen": AppPagesRoutes.islamReligionOfPace,
      },
      {
        "title": "Derechos humanos en el Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.humanrightsinislam.com',
        "description": "La verdad sobre el Islam",
        "targetScreen": AppPagesRoutes.huminRight,
      },
      {
        "title": "la mujer en el Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.womeninislam.ws',
        "description": "La verdad sobre el Islam",
        "targetScreen": AppPagesRoutes.womenInIslam,
      },
      {
        "title": "Romance en el Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.romanceinislam.com',
        "description": "Entre el hombre y su mujer",
        "targetScreen": AppPagesRoutes.romanceInIslam,
      },
      {
        "title": "Amor en el Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://loveinislam.ws',
        "description": "Entre el hombre y su mujer",
        "targetScreen": AppPagesRoutes.loveInIslam,
      },
      {
        "title": "inovación (Bidaa) en la adoración",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.bidaainislam.com',
        "description": "Compromiso con la ley de Dios sin cambios",
        "targetScreen": AppPagesRoutes.bidaaInIslam,
      },
      {
        "title": "El Principio y el fin",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.thisistruth.org',
        "description": "El principio y el fin de la Vida",
        "targetScreen": AppPagesRoutes.beginningAndEnd,
      },
      {
        "title": "La fortaleza del creyente",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.athkar.ws',
        "description": "Una explicación del Islam",
        "targetScreen": AppPagesRoutes.hisnulMumin,
      },
      {
        "title": "los primeros pasos",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'https://www.learningislam.com',
        "description": "Una explicación del Islam",
        "targetScreen": AppPagesRoutes.firstSteps,
      },
      {
        "title": "Aprende el Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.1ststepsinislam.com',
        "description": "Los primeros pasos en el Islam",
        "targetScreen": AppPagesRoutes.learningIslam,
      },
      // {
      //   "title": "Los Términos",
      //   "copyRight":
      //       'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
      //   "link": 'https://terminologyenc.com',
      //   "description": "Términos islámicos en español",
      //   "targetScreen": AppPagesRoutes.terminology,
      // },
    ],
    //6
    [
      {
        "title": "Canales de telegram",
        "description": "Explorar los mensajes de canales islámico",
        "targetScreen": AppPagesRoutes.telegram,
        "copyRight":
            "Recopilar la mayor parte del contenido de los canales islámicos en la aplicación Telegram y copiar todos los mensajes que contiene para leerlos, copiarlos y buscarlos fácilmente. En el caso de que haya una imagen, un videoclip o un clip de audio, se coloca el enlace. al hacer clic en el enlace accedes a la imagen o vídeo dentro del canal original.\nAviso: El contenido no ha sido revisado.\nSi hay música, no está permitido que un musulmán la escuche.\nA los hombres no les está permitido mirar a las mujeres."
      },
      {
        "title": "Canales de Youtube",
        "description": "Explorar los videos de canales islámicos",
        "targetScreen": AppPagesRoutes.youtube,
        "copyRight":
            "El siguiente contenido es una recopilación de videoclips en canales islámicos.\nEl contenido de estos canales no ha sido revisado.\nAviso :\nNo está permitido que un hombre o una mujer musulmana escuche música si el vídeo contiene música.\nSi eres hombre, no está permitido que mires a mujeres si hay mujeres en el vídeo."
      },
      {
        "title": 'Audios',
        "description": "",
        "copyRight":
            "Estos audios no han sido revisados, pero no está permitido que un musulmán escuche música.\nSi el clip contiene música, está permitido escucharlo.",
        "targetScreen": [
          {
            "title": "Islam Messege (Mensaje del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islammessage.org',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamMessageAudios,
          },
          {
            "title": "Islam Land (Tierra del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islamland.com',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamLandAudio,
          },
          {
            "title": "Rasoul Al-lah (el Mensajero de Al-láh)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.rasoulallah.net',
            "description": "sobre el profeta Muhammad ﷺ",
            "targetScreen": AppPagesRoutes.rasulullahAudios,
          },
          {
            "title": "Knowing Allah (Conociendo a Al-láh)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.knowingallah.com',
            "description": "sobre nuestra creencia en Dios",
            "targetScreen": AppPagesRoutes.knowingAllahAudios,
          },
          {
            "title": "Guía al Islam",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'https://www.guidetoislam.com',
            "description": "Una explicación del Islam",
            "targetScreen": AppPagesRoutes.guideToIslamAudios,
          },
          {
            "title": "Islam House (Casa del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islamhouse.com',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamHouseAudios,
          },
        ],
      },
      {
        "title": 'Vídeos',
        "description": "",
        "copyRight":
            "Estos vídeos no han sido revisados.\nPero a los hombres no les está permitido mirar a mujeres si hay un vídeo que contiene fotos de mujeres.",
        "targetScreen": [
          {
            "title": "Islam Land (Tierra del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islamland.com',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamLandVideos,
          },
          {
            "title": "Rasoul Al-lah (el Mensajero de Al-láh)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.rasoulallah.net',
            "description": "sobre el profeta Muhammad ﷺ",
            "targetScreen": AppPagesRoutes.rasulullahVideos,
          },
          {
            "title": "Knowing Allah (Conociendo a Al-láh)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.knowingallah.com',
            "description": "sobre nuestra creencia en Dios",
            "targetScreen": AppPagesRoutes.knowingAllahVideos,
          },
          {
            "title": "Guía al Islam",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'https://www.guidetoislam.com',
            "description": "Una explicación del Islam",
            "targetScreen": AppPagesRoutes.guideToIslamVideos,
          },
          {
            "title": "Islam Messege (Mensaje del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islammessage.org',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamMessageVideos,
          },
          {
            "title": "Islam Messege Quran Videos (Mensaje del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islammessage.org',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamMessageQuranVideos,
          },
          {
            "title": "Islam House (Casa del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islamhouse.com',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamHouseVideos,
          },
        ],
      },
      {
        "title": 'La Biblioteca',
        "description": "",
        "targetScreen": [
          {
            "title": "Islam Messege (Mensaje del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islammessage.org',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamMessageBooks,
          },
          {
            "title": "Islam Land (Tierra del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islamland.com',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamLandBooks,
          },
          {
            "title": "Islam House (Casa del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islamhouse.com',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamHouseBooks,
          },
          {
            "title": "Knowing Allah (Conociendo a Al-láh)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.knowingallah.com',
            "description": "sobre nuestra creencia en Dios",
            "targetScreen": AppPagesRoutes.knowingAllahBooks,
          },
          {
            "title": "Guía al Islam",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'https://www.guidetoislam.com',
            "description": "Una explicación del Islam",
            "targetScreen": AppPagesRoutes.guideToIslamBooks,
          },
          {
            "title": "Quiero abrazar el islam pero",
            "description": "",
            "fun": true,
            "icon": Icons.menu_book,
            // "targetScreen": AppPagesRoutes.guideToIslamBooks,
          },
          {
            "title": "Guia para hacer dawah",
            "description": "",
            "fun": false,
            "icon": Icons.menu_book,
            // "targetScreen": AppPagesRoutes.guideToIslamBooks,
          },
        ],
      },
      {
        "title": 'Fatwa',
        "description": "",
        "targetScreen": [
          {
            "title": "Islam House (Casa del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islamhouse.com',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamHouseFatwa,
          },
          {
            "title": "Islam Land (Tierra del Islam)",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islamland.com',
            "description": "Contenido islámico integrado",
            "targetScreen": AppPagesRoutes.islamLandFatwa,
          },
          {
            "title": "Islam QA",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.Islamqa.com',
            "description": "Respuestas a las preguntas de los musulmanes",
            "targetScreen": AppPagesRoutes.islamQA,
          },
          {
            "title": "Islam web",
            "copyRight":
                'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
            "link": 'http://www.islamweb.net',
            "description": "Respuestas a las preguntas de los musulmanes",
            "targetScreen": AppPagesRoutes.islamWeb,
          },
        ],
      }
    ],
    [
      {
        'title': 'Azkar',
        'description': '',
        'targetScreen': AppPagesRoutes.azkarBodtScreen,
      },
      {
        'title': 'Doaa',
        'description': '',
        'targetScreen': AppPagesRoutes.doaaBodyScreen,
      },
      {
        'title': 'Sonan',
        'description': '',
        'targetScreen': AppPagesRoutes.bodySonanScreen,
      },
      // {
      //   'title'
      // }
    ]
  ];

  List<Map> searchResult = [];

  void search(String query) {
    searchResult.clear();
    page.forEach((item) {
      item.forEach((items) {
        items['title'].contains(query) ? searchResult.add(items) : null;
      });
    });
    print(searchResult);
  }

  @override
  void onInit() {
    selectedPart;
    super.onInit();
  }
}
