// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hiwayda_oracion_islamica/core/widgets/custom_paginator.dart';
// import 'package:hiwayda_oracion_islamica/features/sites/domain/entities/fixed_entities.dart';
// import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/islam_land/islam_land_controller.dart';
// import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';
// import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';

// class IslamLandSearch extends StatelessWidget {
//   // final data;
//   const IslamLandSearch({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const AppBarCustom(title: "Islam Land Articals")
//           .customAppBar(context),
//       body: GetBuilder<IslamLandControllerImp>(
//         builder: (controller) => Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 onFieldSubmitted: (val) {
//                   controller.searchArticle();
//                 },
//                 controller: controller.searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search in Articals',
//                   filled: true,
//                   fillColor: const Color.fromARGB(255, 226, 226, 226),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                 child: CustomPaginator<FixedEntities>(
//                   data: controller.searchResult,
//                   getItemText: (item) => item.name,
//                   onItemTaped: (item) {
//                     Get.to(ArticalCustom(dataText: item.content));
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
