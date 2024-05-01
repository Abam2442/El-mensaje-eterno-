import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_jsons.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/section_item_homeP_page_widget.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/lessons_details_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/practical_learn_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/salah_importance_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/wudu_practical_page.dart';
class TaharaPage extends StatelessWidget {
  const TaharaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Aprender Purificacion',
            style: Styles.textStyle20Black,
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
          backgroundColor: AppColors.kWhiteColor,
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
                            Get.to(()=>
                                LessonsDetailsPage(
                                  list: AppPublicVar.taharaLessons[0].lessonDetail,
                                  title: AppPublicVar.taharaLessons[0].title,
                                  icon: AppSvgs.wudoa,
                                ));
                          },
                        ),
                      SectionItemHomePageWidget(
                        //
                        //Educación avanzada
                        sectionIcon: AppSvgs.wudoa,
                        sectionName: 'Practico Wudu',
                        sectionSubtitle: '',
                        onTap: () {
                          Get.to(()=>WuduPracticalPage(
                              jsonFile: AppJsons.wudu));
                        },
                      ),
                        SectionItemHomePageWidget(
                            onTap: () {
                              AppRoutes.routeTo(
                                  context,
                                  LessonsDetailsPage(
                                    list: AppPublicVar.taharaLessons[2].lessonDetail,
                                    title: AppPublicVar.taharaLessons[2].title,
                                    icon: AppSvgs.wudoa,
                                  ));
                            },
                            sectionIcon: AppSvgs.wudoa,
                            sectionName: 'Aprendizaje secundario',
                            sectionSubtitle: ''),

                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
