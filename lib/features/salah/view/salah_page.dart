import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_public_var.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_svgs.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/section_item_homeP_page_widget.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/lessons_details_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/practical_learn_page.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/salah_importance_page.dart';

class SalahPage extends StatelessWidget {
  const SalahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Aprender Oracion',
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
                          onTap: () {
                            AppRoutes.routeTo(
                                context,
                                LessonsDetailsPage(
                                  list: AppPublicVar
                                      .taharaLessons[1].lessonDetail,
                                  title: AppPublicVar.taharaLessons[1].title,
                                  icon: AppSvgs.salahrokoa,
                                ));
                          },
                          sectionIcon: AppSvgs.salahrokoa,
                          sectionName: 'Aprendizaje esencial',
                          sectionSubtitle: ''),
                      SectionItemHomePageWidget(
                        onTap: () {
                          Get.to(() => const PracticalLearnPage(
                                level: 0,
                              ));
                        },
                        sectionIcon: AppSvgs.learnSalah,
                        sectionName: 'Practico Aprende a orar Principiante',
                        sectionSubtitle: '',
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
                                  list: AppPublicVar
                                      .taharaLessons[3].lessonDetail,
                                  title: AppPublicVar.taharaLessons[3].title,
                                  icon: AppSvgs.salahrokoa,
                                ));
                          },
                          sectionIcon: AppSvgs.salahrokoa,
                          sectionName: 'Aprendizaje secundario',
                          sectionSubtitle: ''),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
