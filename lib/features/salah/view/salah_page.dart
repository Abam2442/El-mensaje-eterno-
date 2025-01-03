import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/section_item_homeP_page_widget.dart';
import 'package:hiwayda_oracion_islamica/features/salah/salah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/lessons_details_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/practical_learn_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/salah_importance_page.dart';

class SalahPage extends StatelessWidget {
  const SalahPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SalahController controller = SalahController.instance;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Aprender Oracion',
            style: Styles.textStyle20Golden,
          ),
          iconTheme: const IconThemeData(
            color: AppColors.kGoldenColor,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const SalahImportancePage());
              },
              icon: const Icon(
                Icons.info_outline,
                color: AppColors.kGoldenColor,
              ),
            )
          ],
          backgroundColor: AppColors.kPrimaryColor,
        ),
        backgroundColor: AppColors.kWhiteColor,
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
                      // SizedBox(
                      //   height: Get.height*0.05,
                      //   child: Text('Aprender Purificacion',style: Styles.textStyle20Golden),
                      // ),
                      5.hSize,
                      SectionItemHomePageWidget(
                        onTap: () {
                          AppRoutes.routeTo(
                              context,
                              LessonsDetailsPage(
                                list: controller.lessonTahara[1].lessonDetail,
                                title: controller.lessonTahara[1].title,
                                icon: AppSvgs.salahrokoa,
                              ));
                        },
                        sectionIcon: AppSvgs.salahrokoa,
                        sectionName: 'Aprendizaje esencial',
                        sectionSubtitle: '',
                        textInfo: '''
Aprendizaje esencial de la Oración 

Estas son lecciones teóricas muy importantes.
Estas son las primeras lecciones que hay que aprender antes de empezar la formación práctica 

Trate de comprender bien las lecciones para poder comprender las lecciones prácticas más adelante.''',
                      ),
                      SectionItemHomePageWidget(
                        onTap: () {
                          Get.to(() => const PracticalLearnPage(
                                level: 0,
                              ));
                        },
                        sectionIcon: AppSvgs.learnSalah,
                        sectionName: 'Practico Aprende a orar Principiante',
                        sectionSubtitle: '',
                        textInfo: '''
Aprendizaje Práctico

Una vez que termines de aprender muy bien las lecciones teóricas, podrás comenzar a aplicar lo aprendido.

 Encontrarás aquí un método único,Insha'allah , para enseñar cada paso en detalle y enseñar la pronunciación de cada palabra en detalle.

 Se aprende y se va paso a paso.
 Si quieres poner a prueba tu pronunciación y comprensión de las lecciones, puedes enviar la pronunciación por WhatsApp, ya que en su interior aparece el lateral de cada frase en árabe.


Aviso:
 En educación utilizamos lo que se llama transliteración, que significa una traducción fonética de textos árabes a letras españolas. 

 Ejemplos :

Allâhu Akbar
Subhana rabbi al a'alaa
Rabi ighfer li
Arrahmani arrahim
Samiaa allahu leman 7am ida
..... Etc

⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
No es correcto confiar en estas palabras traducidas para memorizarlas.
 Ponemos estos símbolos sólo para que entiendas cómo pronunciar palabras árabes.
 Por lo tanto, sólo debes confiar en las palabras que escuchas y no en las letras del español.
 Debido a que existen fonemas, la lengua árabe no tiene una fonética equivalente en la lengua española.


🌟🌟🌟🌟🌟
Esa es la clave de las letras especiales utilizadas en los vídeos ilustrativos.
 Aprende la pronunciación para que te resulte más fácil entender la pronunciación correcta de las letras
''',
                      ),
                      SectionItemHomePageWidget(
                        onTap: () {
                          Get.to(() => const PracticalLearnPage(
                                level: 1,
                              ));
                        },
                        sectionIcon: AppSvgs.learnSalah,
                        sectionName: 'Practico Aprende a orar Intermedio',
                        sectionSubtitle: '',
                        textInfo: '''
Aprendizaje Práctico

Una vez que termines de aprender muy bien las lecciones teóricas, podrás comenzar a aplicar lo aprendido.

 Encontrarás aquí un método único,Insha'allah , para enseñar cada paso en detalle y enseñar la pronunciación de cada palabra en detalle.

 Se aprende y se va paso a paso.


Aviso:
 En educación utilizamos lo que se llama transliteración, que significa una traducción fonética de textos árabes a letras españolas. 

 Ejemplos :

Allâhu Akbar
Subhana rabbi al a'alaa
Rabi ighfer li
Arrahmani arrahim
Samiaa allahu leman 7am ida
..... Etc

⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
No es correcto confiar en estas palabras traducidas para memorizarlas.
 Ponemos estos símbolos sólo para que entiendas cómo pronunciar palabras árabes.
 Por lo tanto, sólo debes confiar en las palabras que escuchas y no en las letras del español.
 Debido a que existen fonemas, la lengua árabe no tiene una fonética equivalente en la lengua española.


🌟🌟🌟🌟🌟
Esa es la clave de las letras especiales utilizadas en los vídeos ilustrativos.
 Aprende la pronunciación para que te resulte más fácil entender la pronunciación correcta de las letras
''',
                        isVideo: true,
                      ),
                      // SectionItemHomePageWidget(
                      //   onTap: () {
                      //     Get.to(() => const PracticalLearnPage(
                      //           level: 2,
                      //         ));
                      //   },
                      //   sectionIcon: AppSvgs.learnSalah,
                      //   sectionName: 'Practico Apende a orar Avanzado',
                      //   sectionSubtitle: '',
                      // ),
                      SectionItemHomePageWidget(
                        onTap: () {
                          AppRoutes.routeTo(
                              context,
                              LessonsDetailsPage(
                                list: controller.lessonTahara[3].lessonDetail,
                                title: controller.lessonTahara[3].title,
                                icon: AppSvgs.salahrokoa,
                              ));
                        },
                        sectionIcon: AppSvgs.salahrokoa,
                        sectionName: 'Aprendizaje secundario',
                        sectionSubtitle: '',
                        textInfo: '''
Aprendizaje secundario de la Oración 

Estas son lecciones teóricas muy importantes 

Después de que termines de aprender las lecciones prácticas y las domines muy bien.

Aquí encontrarás lecciones teóricas avanzadas para empezar a aprender.''',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
