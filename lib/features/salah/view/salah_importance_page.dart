import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/styles/text_styles.dart';

class SalahImportancePage extends StatelessWidget {
  const SalahImportancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          title: const Text(
            "La importancia de la oración.",
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
                      InkWell(
                        onTap: () {
                          launchURL('https://youtu.be/77j7y2_jV9k?si=xjvFqHs4PBsE7KR7');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Click To Watch a Video',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            5.wSize,
                            Image.asset(AppImages.youtube),
                          ],
                        ),
                      ),
                      10.hSize,
                      Text(
                        'oración, que significa rezar, hacer la ibada (adoración), pedir ser perdonado y suplicar a Allah, se expresa con la palabra “salat” en árabe. Rezar significa al mismo tiempo inclinarse ante la grandiosidad de Allah, mostrar la servidumbre y como palabra significa el lazo. La oración (salat) es considerada en el Islam como el miraj del musulmán, es decir el camino de acercarse al Gran Creador y el camino para ascender ante Su presencia. Por eso, la oración es considera como la ibada más importante. El musulmán vive el placer espiritual y el bienestar de estar ante de la presencia de Allah en la oración y mostrar su servidumbre. Se eleva espiritualmente alojándose de todos los trabajos y pensamientos mundanos. Por eso, la oración es la forma más concreta d la orientación de todos los profetas hacia Allah.'
                        '\n\n\n'
                        'Rezamos para mejorarnos, para recordar siempre que hay gran Dios (Alá) que nos ayuda. La oración nos recuerda cinco veces al día que hay gran creador que va a juzgarnos por eso no debemos cometer injusticia contra los demás. La oración nos da la paz interior. Porque nos recuerda que cualquier problema tiene solución por que Alá controla el mundo.'
                        '\n\n\n'
                        'El segundo pilar, es el de la relación y el contacto con Alá, que es la oración. La consideramos la mejor parte del día, es cuando nos olvidamos de todo el mundo con sus tristezas y sus problemas para contactar con Alá, cinco veces al día, es la fuente de paz interior.'
                        'Cuando rezamos sentimos gran relajamiento y paz. Alá nos ordena: \'\'Cumplan con la oración'
                        ' Corán 2:43, y este complemento, significa ser buena persona, ser positiva, hacer el bien, evitar el mal, etc. \'\'cumple con la oración, porque la oración conserva de cometer actos inmorales y reprobables. \'\' Corán 29:45. Por eso la oración nos mejora y nos purifica de la inmoralidad.'
                        'Por eso la oración es nuestra brújula. Nos recuerda que Alá es el Todopoderoso, por ello, si somos fuertes, no debemos mal usar esta fuerza, y si somos débiles, sabemos que el todopoderoso nos ayudará. Por ello también, se legisló la oración, para darnos paz interior y fortalecernos. ‘Diles: mi oración, mi ofrenda, mi vida, y mi muerte pertenecen a Dios, Señor del universo.’ (Corán 6:162)',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      )
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
