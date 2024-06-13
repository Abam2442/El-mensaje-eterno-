// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/islam_house/islam_house_controller.dart';
// import '../../widget/app_bar_custom.dart';
// import '../../widget/inkwell_custom.dart';

// class IslamHouseMainScreen extends StatelessWidget {
//   const IslamHouseMainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(IslamHouseControllerImp());
//     return Scaffold(
//       appBar: const AppBarCustom(title: "Islam House").customAppBar(context),
//       body: GetBuilder<IslamHouseControllerImp>(builder: (controller) {
//         return Container(
//             margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//             child: ListView.builder(
//                 padding: const EdgeInsets.all(5),
//                 itemCount: controller.title.length,
//                 itemBuilder: (context, index) {
//                   return InkwellCustom(
//                     catigory: true,
//                     iconData: controller.icons[index],
//                     dataText: controller.title[index],
//                     onTap: () {
//                       Get.to(controller.page[index]);
//                     },
//                   );
//                 }));
//       }),
//     );
//   }
// }
