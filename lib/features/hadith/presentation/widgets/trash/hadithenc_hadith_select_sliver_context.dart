// import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
// import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:number_paginator/number_paginator.dart';

// import '../../../../core/constants/app_pages_routes.dart';
// import '../../../../core/widgets/primary_list_tile.dart';

// class HadithencCategorySelectSliver extends GetView<HadithController> {
//     const HadithencCategorySelectSliver({super.key});
//    @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: GetBuilder<HadithController>(
//         builder: (controller) {
//               controller.getSubCategoryHadithesName ?? [];
//           if(controller.pageNumber == 0) {
//             controller.subCategoryHadithesNameForList.clear();
//             controller.subCategoryHadithesNameForList.addAll(
//                 controller.getSubCategoryHadithesName!.getRange(
//                     0, controller.getSubCategoryHadithesName!.take(20).length));
//           }
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   color: AppColors.kPrimaryColor,
//                   child: Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(25),
//                             topRight: Radius.circular(25)),
//                         child: Container(
//                           color: AppColors.kWhiteColor,
//                           child: Column(
//                             children: [
//                               const SizedBox(height: 10),
//                             NumberPaginator(
//                             // by default, the paginator shows numbers as center content
//                             numberPages: controller.getSubCategoryHadithesName!.take(20).length <20?1:(controller.getSubCategoryHadithesName!.length/20).round(),
//                             onPageChange: (int pageNumber) {
//                             print(pageNumber.toString());
//                             controller.pageNumber == pageNumber;
//                             controller.subCategoryHadithesNameForList.clear();
//                             controller.subCategoryHadithesNameForList = <String>[].obs;
//                             if (pageNumber == 0) {
//                             controller.subCategoryHadithesNameForList.addAll(
//                                 controller.getSubCategoryHadithesName!.getRange(
//                             0, controller.getSubCategoryHadithesName!.take(20).length));
//                             } else {
//                             controller.subCategoryHadithesNameForList.addAll(
//                                 controller.getSubCategoryHadithesName!.getRange(
//                             (pageNumber *20), controller.getSubCategoryHadithesName!.take(((pageNumber+1) *20)).length,));
//                             }
//                             controller.update();
//                             },
//                             // show/hide the prev/next buttons
//                             showPrevButton: true,
//                             showNextButton: true,  // defaults to true
//                             // custom content of the prev/next buttons, maintains their behavior
//                             nextButtonContent: const Icon(Icons.arrow_right_alt),
//                             // custom prev/next buttons using builder (ignored if showPrevButton/showNextButton is false)
//                             // prevButtonBuilder: (context) => TextButton(
//                             //   onPressed: controller.pageController.currentPage > 0 ? () => controller.pageController.prev() : null,  // _controller must be passed to NumberPaginator
//                             //   child: const Row(
//                             //     children: [
//                             //       Icon(Icons.chevron_left),
//                             //       Text("Previous"),
//                             //     ],
//                             //   ),
//                             // ),
//                             ),
//                           Obx(()=>controller.subCategoryHadithesNameForList.isEmpty?SizedBox(height: Get.height*0.5,child: const Center(child: Text(
//                             "neniuj rezultoj",style: TextStyle(color: Colors.black,fontSize: 18),
//                           ),),):ListView.builder(itemCount: controller.subCategoryHadithesNameForList.length,
//                           physics: const ScrollPhysics(),
//                           shrinkWrap: true,itemBuilder: (context,index){
//                                   return PrimaryListTile(
//                                     onTap: () {
//                                       Get.toNamed(
//                                         AppPagesRoutes.contentHadithScreen,
//                                         arguments: {
//                                           "title": controller.subCategoryHadithesNameForList[index],
//                                           "bookName": Get.arguments['title'],
//                                           "categoryName":
//                                               Get.arguments['categoryName'],
//                                           "webside": "hadithenc",
//                                         },
//                                       );
//                                     },
//                                     es: controller.subCategoryHadithesNameForList[index],
//                                     itemNumber: index + 1,
//                                     ar: '',
//                                     isSaved: false,
//                                   );
//                                 },
//                               )),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
