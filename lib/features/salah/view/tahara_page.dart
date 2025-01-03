import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_jsons.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/section_item_homeP_page_widget.dart';
import 'package:hiwayda_oracion_islamica/features/salah/salah_controller.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/lessons_details_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/salah_importance_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/wudu_practical_page.dart';

class TaharaPage extends StatelessWidget {
  const TaharaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SalahController controller = SalahController.instance;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.kGoldenColor,
          ),
          backgroundColor: AppColors.kPrimaryColor,
          title: const Text(
            'Aprender Purificacion',
            style: Styles.textStyle20Golden,
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
                        //
                        //Educación avanzada
                        sectionIcon: AppSvgs.wudoa,
                        sectionName: 'Aprendizaje esencial',
                        sectionSubtitle: '',
                        onTap: () {
                          Get.to(() => LessonsDetailsPage(
                                list: controller.lessonTahara[0].lessonDetail,
                                title: controller.lessonTahara[0].title,
                                icon: AppSvgs.wudoa,
                              ));
                        },
                        textInfo: '''
Aprendizaje esencial de la purificación 

 Estas son lecciones teóricas muy importantes.
 Estas son las primeras lecciones que hay que aprender antes de empezar la formación práctica 

 Trate de comprender bien las lecciones para poder comprender las lecciones prácticas más adelante.''',
                      ),
                      SectionItemHomePageWidget(
                        //
                        //Educación avanzada
                        sectionIcon: AppSvgs.wudoa,
                        sectionName: 'Practico Wudu',
                        sectionSubtitle: '',
                        onTap: () {
                          Get.to(
                              () => WuduPracticalPage(jsonFile: AppJsons.wudu));
                        },
                        textInfo: '''
práctica aprendizaje sobre abluciones (Wudu). 

 Después de estudiar bien las lecciones teóricas en Aprendizaje esencial , comenzamos la práctica Aprendizaje 

 Encuentra 11 pasos que puedes empezar a aprender paso a paso''',
                      ),
                      SectionItemHomePageWidget(
                        onTap: () {
                          AppRoutes.routeTo(
                              context,
                              LessonsDetailsPage(
                                list: controller.lessonTahara[2].lessonDetail,
                                title: controller.lessonTahara[2].title,
                                icon: AppSvgs.wudoa,
                              ));
                        },
                        sectionIcon: AppSvgs.wudoa,
                        sectionName: 'Aprendizaje secundario',
                        sectionSubtitle: '',
                        textInfo: '''
Aprendizaje secundario de la purificación 

 Estas son lecciones teóricas muy importantes 
 
Después de dominar las lecciones essencialas y práctico wudu , comenzamos a aprender cuestiones adicionales relacionadas con la pureza, ya que son lecciones muy importantes.''',
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
