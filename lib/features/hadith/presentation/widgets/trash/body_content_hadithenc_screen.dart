// import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';

// import '../../../../core/constants/app_assets.dart';
// import '../../../../core/services/easy_loader_service.dart';
// import '../../../../core/styles/text_styles.dart';

// class BodyContentHadithencScreen extends GetView<HadithController> {
//   const BodyContentHadithencScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     String categoryName = Get.arguments["categoryName"];
//     String subCategoryName = Get.arguments["bookName"];
//     String hadithName = Get.arguments["title"];

//     // List<String>? hadith = controller.getHadithencHadith(
//     //   categoryName,
//     //   subCategoryName,
//     //   hadithName,
//     // );
//     return SliverToBoxAdapter(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 13,
//                 vertical: 8,
//               ),
//               child: Text(
//                 hadithName,
//                 style: Styles.textStyle18Godlen,
//               ),
//             ),
//             const SizedBox(height: 12),
//             HadithContainer(hadith: hadith ?? []),
//             const SizedBox(height: 12),
//             const Text(
//               'Explanation',
//               style: Styles.textStyle18Godlen,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(left: 12),
//                     constraints: BoxConstraints(
//                         maxWidth: MediaQuery.sizeOf(context).width - 50),
//                     child: Text(
//                       hadith?[2] ?? "",
//                       style: Styles.textStyle18Black,
//                       textDirection: TextDirection.ltr,
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () async {
//                       var data = ClipboardData(text: hadith?[2] ?? "");
//                       await Clipboard.setData(data);
//                       EasyLoaderService.showToast(message: "Copied");
//                     },
//                     child: SvgPicture.asset(
//                       AppAssets.kCopyIcon,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 12),
//           ],
//         ),
//       ),
//     );
//   }
// }
