// // import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
// // import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/body_content_hadithenc_screen.dart';
// // import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/body_content_sunnah_screen.dart';

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // class ContentHadithScreen extends StatelessWidget {
// //   const ContentHadithScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     String hadithName = Get.arguments["title"];
// //     List<String> hadith = Get.arguments["hadith"];
// //     return Scaffold(
// //       backgroundColor: AppColors.kPrimaryColor,
// //       appBar: AppBar(
// //         backgroundColor: AppColors.kPrimaryColor,
// //         titleTextStyle: const TextStyle(
// //           color: AppColors.kGoldenColor,
// //           fontWeight: FontWeight.bold,
// //           fontSize: 20,
// //           fontFamily: 'Poppins',
// //           letterSpacing: 1.5,
// //           height: 1.5,
// //           decoration: TextDecoration.none,
// //           decorationColor: AppColors.kWhiteColor,
// //           decorationStyle: TextDecorationStyle.solid,
// //           decorationThickness: 1,
// //         ),
// //         title: Text(hadithName),
// //         centerTitle: true,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(15),
// //         child: Get.arguments['label'] == "la sunnah"
// //             ? const BodyContentSunnahScreen()
// //             : const BodyContentHadithencScreen(),
// //       ),
// //     );
// //   }
// // }

// import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
// import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
// import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
// import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/body_content_hadithenc_screen.dart';
// import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/body_content_sunnah_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ContentHadithScreen extends GetView<HadithController> {
//   const ContentHadithScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: [
//                 // const SliverAppBarWidget(
//                 //   backgroundColor: AppColors.kWhiteColor,
//                 //   iconColor: Color.fromRGBO(42, 44, 65, 1),
//                 // ),
//                 Get.arguments["webside"] == "sunnah"
//                     ? const BodyContentSunnahScreen()
//                     : const BodyContentHadithencScreen(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
