import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_images.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/Qibla/qibla_compass.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/tahara_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/salah_page.dart';

import '../../home/presentation/widgets/section_item_homeP_page_widget.dart';
import 'prayer_times_page.dart';

class LearnSalah extends StatelessWidget {
  const LearnSalah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aprender el salah',
          style: Styles.textStyle20Golden,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.kGoldenColor,
        ),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: 10.aEdge,
                  padding: 15.aEdge,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.salah
                          //fit: BoxFit.fitWidth,
                          ),
                    ),
                    borderRadius: BorderRadius.circular(15),
                    // color: AppColors.kWhiteColor.withOpacity(0.6),
                  ),
                  width: context.width,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.kWhiteColor.withOpacity(0.1)),
                    child: Text(
                      'De Abdallah Ibn Masúd que dijo:\n\n'
                      '“Pregunté al Mensajero de Allah ﷺ : “¿Cuál es la obra más amada por Allah?”\n'
                      'Dijo: “Realizar la oración a su tiempo”. (en un otro relato: en su primer momento)........\n'
                      'Bujari y muslim',
                      style: AppTextStyles.h6amber,
                    ),
                  ),
                ),
                /*Container(
                    width: context.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      // Image border
                      child: SizedBox.fromSize(
                          size: Size.fromRadius(context.width * 0.2),
                          // Image radius
                          child: Image.asset(
                            AppImages.salah,
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                  ),*/
                2.hSize,
                const Text(
                  'Aprender Salah',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: context.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: 8.aEdge,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SectionItemHomePageWidget(
                        onTap: () {
                          Get.to(const TaharaPage());
                        },
                        sectionIcon: AppSvgs.wudoa,
                        sectionName: 'Aprender Purificacion',
                        sectionSubtitle: '',
                        isInfo: false,
                        textInfo: '''
La importancia de la Purificación en el Islam, y es una condición que se debe cumplir antes de realizar la oración

De Ibn Umar que dijo:

Que fue a lo de Ibn ‘Amir (para conocer su estado de salud) ya que estaba enfermo y le dijo (Ibn ‘Amir) “Ibn ‘Umar ¿por qué no ruegas a Allah por mí?”.
Él contestó: “Escuché al Mensajero de Allah ﷺ decir: “Ninguna oración es aceptada sin la purificación previa,........ Muslim

De Abu Málik Al Hariz Ibn Asim Al Asharí, Allah esté complacido con él que el Mensajero de Allah ﷺ dijo

“La purificación es la mitad del imán (de la fe)....... Muslim''',
                      ),
                      SectionItemHomePageWidget(
                        onTap: () {
                          Get.to(const SalahPage());
                        },
                        sectionIcon: AppSvgs.learnSalah,
                        sectionName: 'Aprender Oracion',
                        sectionSubtitle: '',
                        isInfo: true,
                        textInfo: '''
''',
                      ),
                      // SectionItemHomePageWidget(
                      //     onTap: () {
                      //       Get.to(const BaseLearn(isBasic: true));
                      //     },
                      //     sectionIcon: AppSvgs.salahrokoa,
                      //     sectionName: 'Educación teórica básica.',
                      //     sectionSubtitle: ''),
                      //
                      // SectionItemHomePageWidget(
                      //     onTap: () {
                      //       Get.to(()=> const BaseLearn(isBasic: false));
                      //     },
                      //     sectionIcon: AppSvgs.salahrokoa,
                      //     sectionName: 'Educación avanzada',
                      //     sectionSubtitle: ''),

                      SectionItemHomePageWidget(
                        onTap: () {
                          Get.to(() => const QiblaCompass());
                        },
                        sectionIcon: AppSvgs.qibla,
                        sectionName: 'Qibla',
                        sectionSubtitle: '',
                        textInfo: '''
Qibla dirección 

 Puedes identificar la dirección de la Qibla a través de la flecha naranja en la dirección de la forma de la Kaaba.''',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
