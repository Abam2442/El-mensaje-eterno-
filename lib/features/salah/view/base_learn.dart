// import 'package:get/get.dart';
// import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
// import 'package:hiwayda_oracion_islamica/core/constants/app_routes.dart';
// import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:hiwayda_oracion_islamica/features/salah/view/lessons_details_page.dart';

// import '../../../core/styles/text_styles.dart';
// import '../../../core/constants/app_public_var.dart';
// import '../../../core/constants/app_svgs.dart';
// import '../../home/presentation/widgets/section_item_homeP_page_widget.dart';
// class BaseLearn extends StatelessWidget {
//   final bool isBasic;

//   const BaseLearn({super.key, required this.isBasic});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.kPrimaryColor,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: 16.aEdge,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: context.height*0.05,
//                         child: Text(isBasic? 'Educación teórica básica.' : 'Educación avanzada',style: Styles.textStyle20Golden),
//                       ),
//                       5.hSize,
//                       if(isBasic)
//                       SectionItemHomePageWidget(
//                         //
//                         //Educación avanzada
//                         sectionIcon: AppSvgs.wudoa,
//                         sectionName: 'Aprender Purificacion 1',
//                         sectionSubtitle: '',
//                         onTap: () {
//                           Get.to(()=>
//                               LessonsDetailsPage(
//                                 list: AppPublicVar.taharaLessons[0].lessonDetail,
//                                 title: AppPublicVar.taharaLessons[0].title,
//                                 icon: AppSvgs.wudoa,
//                               ));
//                         },
//                       ),
//                       if(isBasic)
//                       SectionItemHomePageWidget(
//                           onTap: () {
//                             AppRoutes.routeTo(
//                                 context,
//                                 LessonsDetailsPage(
//                                   list: AppPublicVar.taharaLessons[1].lessonDetail,
//                                   title: AppPublicVar.taharaLessons[1].title,
//                                   icon: AppSvgs.salahrokoa,
//                                 ));
//                           },
//                           sectionIcon: AppSvgs.salahrokoa,
//                           sectionName: 'Aprender Oracion 1',
//                           sectionSubtitle: ''),
//                       if(!isBasic)
//                       SectionItemHomePageWidget(
//                           onTap: () {
//                             AppRoutes.routeTo(
//                                 context,
//                                 LessonsDetailsPage(
//                                   list: AppPublicVar.taharaLessons[2].lessonDetail,
//                                   title: AppPublicVar.taharaLessons[2].title,
//                                   icon: AppSvgs.wudoa,
//                                 ));
//                           },
//                           sectionIcon: AppSvgs.wudoa,
//                           sectionName: 'Aprender Purificacion 2',
//                           sectionSubtitle: ''),
//                       if(!isBasic)
//                       SectionItemHomePageWidget(
//                           onTap: () {
//                             AppRoutes.routeTo(
//                                 context,
//                                 LessonsDetailsPage(
//                                   list: AppPublicVar.taharaLessons[3].lessonDetail,
//                                   title: AppPublicVar.taharaLessons[3].title,
//                                   icon: AppSvgs.salahrokoa,
//                                 ));
//                           },
//                           sectionIcon: AppSvgs.salahrokoa,
//                           sectionName: 'Aprender Oracion 2',
//                           sectionSubtitle: ''),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }
