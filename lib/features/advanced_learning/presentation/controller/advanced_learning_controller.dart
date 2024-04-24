// ignore_for_file: camel_case_types

import 'package:get/get.dart';

import '../../../../core/constants/app_pages_routes.dart';

class Advanced_LearningController extends GetxController {
  int selectedPart = 0;

  List titlePart = [
    'El buscador de la verdad',
    'Enciclopedias islámicas',
    'AL-LÁH y su mensajero',
    'Guía al islam',
    'Temas islámicos',
    'Canales de telegram',
  ];

  List<List<Map>> page = [
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
    [
      {
        "title": "Islam House (Casa del Islam)",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'http://www.Islamhouse.com',
        "description": "Contenido islámico integrado",
        "targetScreen": AppPagesRoutes.islamHouse,
      },
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
        "link": 'http://www.1ststepsinislam.com',
        "description": "Los primeros pasos en el Islam",
        "targetScreen": AppPagesRoutes.learningIslam,
      },
      {
        "title": "Aprende el Islam",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'https://www.learningislam.com',
        "description": "Una explicación del Islam",
        "targetScreen": AppPagesRoutes.firstSteps,
      },
      {
        "title": "Los Términos",
        "copyRight":
            'El siguiente contenido no está afiliado al sitio original (no official) .\n Más bien, es mediante la clonación  con web scraping \npara permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.\n También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.\n Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, \n\n Si desea explorar los materiales originales de la fuente,  navegar al sitio original',
        "link": 'https://terminologyenc.com',
        "description": "Términos islámicos en español",
        "targetScreen": AppPagesRoutes.terminology,
      },
    ],
    [
      {
        "title": "Canales de telegram",
        "description": "",
        "targetScreen": AppPagesRoutes.telegram,
      }
    ],
  ];

  changeSelectedPart(val) {
    selectedPart = val;

    update();
  }

  @override
  void onInit() {
    selectedPart;
    super.onInit();
  }
}
