import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class CopyRightPage extends StatelessWidget {
  const CopyRightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          title: const Text(
            "Guía para usar la aplicación",
            style: Styles.textStyle20Golden,
          ),
          backgroundColor: AppColors.kPrimaryColor,
          iconTheme: const IconThemeData(
            color: AppColors.kGoldenColor,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: 16.aEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      10.hSize,
                      const Text(
                        '''Cómo utilizar la aplicación

 Bienvenidos hermano y hermana a la aplicación del mensaje eterno.

 La aplicación aborda todos los niveles.
🌸 Para los no musulmanes
🌸 Y los nuevos musulmanes
🌸 Y los antiguos musulmanes
 hispanohablantes alrededor del mundo

 La aplicación incluye la mayor parte del contenido educativo que explica el Islam en una sola plataforma.

 Incluye aplicación
♦️  6 traducciones del Corán en español 
♦️ La aplicación incluye muchos ♦️hadices del profeta Muhammad صل الله عليه وسلم  
♦️ La aplicación incluye un plan educativo para enseñar al nuevo musulmán (la tercera sección) desde los sitios aprobados y una explicación distinta y única para enseñar la oración de una manera muy fácil y sencilla. 
♦️ La aplicación contiene las súplicas y súplicas que un musulmán necesita durante el día y la noche. 
♦️ La aplicación contiene lecciones para enseñar a los niños. 


🔷 Para la cuarta sección de la solicitud. 
🔷 Contiene 40 sitios web que puedes navegar sin Internet. 
🔷 La aplicación contiene una biblioteca para recopilar todos los libros, lecciones de audio y videoclips. 
🔷 También contiene 60 canales de Telegram y más de 50 canales de YouTube. 
🔷 La aplicación contiene recursos para la enseñanza de la lengua árabe.




 Le pedimos a Al-láh que nos guíe a todo lo bueno, y que esta aplicación te ayude a ti, hermano y hermana, a aprender y acercarte a Al-láh 🤲 .



 Si tienes alguna consulta o sugerencia o no eres musulmán y quieres hablar sobre el Islam.
 Envíame un mensaje en las siguientes redes sociales.


WhatsApp
Wa.me/+201090578754

Facebook
https://www.facebook.com/bassem2442

Telegram
T.me/Abam2442''',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
