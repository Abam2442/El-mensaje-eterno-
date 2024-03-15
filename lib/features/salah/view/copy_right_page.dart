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
            "Fuentes",
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
                        '''El siguiente contenido no está afiliado al sitio original (no official) .
 Más bien, es mediante la clonación  con web scraping 
para permitir la navegación sin conexión en todos los sitios para adaptarse a los hermanos que no tienen Internet continuo.
 También para facilitar el proceso de búsqueda en todos los sitios en una sola plataforma y facilitar la copia rápida.
 Nota: El contenido no incluye las imágenes, videos o audio originales que se encuentran en los sitios, 

 Si desea explorar los materiales originales de la fuente, colocaremos un enlace a cada sitio''',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const Text(
                        '''
                        
Newmuslimguide.com 
Newmuslims.com 
Al-feqh.com 
Islamhouse.com
Islamland.com 
Islamreligion.com 
Islammessage.org 
Islamqa.com
http://www.thepurity.org/
http://www.romanceinislam.com,
http://themessageofislam.org
http://www.humanrightsinislam.com/
http://www.pbuh.us 
http://thereligionofpeace.ws/
http://www.thisistruth.org
http://www.womeninislam.ws/
http://jesusandquran.com/
Saberislam.com
https://guidetoislam.com/
https://islamguide.com/
http://www.thekeytoislam.com
http://islamuniverse.org/ 
https://jesus-is-muslim.net/
https://religiondelislam.com/
https://www.islam-guide.com
La-sunnah.com
Hadithenc.com
https://www.hisnmuslim.com/
https://doa.eqtidaa.com/
https://terminologyenc.com/ 
http://islam-port.com/
http://knowingallah.com/
https://rasoulallah.net/
http://islamweb.net/
https://www.muslim-library.com/
http://islamforchristians.com/
https://www.islam-hinduism.com/
https://www.the-faith.com/
https://www.lastmiracle.com/
http://www.truth-seeker.info/''',
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
