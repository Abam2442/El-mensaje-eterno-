// import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
// import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
// import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/widgets/body_doaa_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../widgets/body_azkar_screen.dart';
// import '../widgets/circle_tap_indicator.dart';

// class AzkarDoaaScreen extends GetView<AzkarDoaaController> {
//   const AzkarDoaaScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.kPrimaryColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.kPrimaryColor,
//         title: const Text(
//           'Azkar And Doaa',
//           style: TextStyle(
//             color: AppColors.kGoldenColor,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.search),
//           ),
//         ],
//         bottom: TabBar(
//           controller: controller.tabController,
//           tabs: controller.tabs,
//           isScrollable: false,
//           labelColor: AppColors.kGoldenColor,
//           unselectedLabelColor: const Color(0xFFffE4AC),
//           indicatorSize: TabBarIndicatorSize.label,
//           indicator:
//               const CircleTapIndicator(color: AppColors.kGreenColor, radius: 4),
//         ),
//       ),
//       body: TabBarView(
//         controller: controller.tabController,
//         children: controller.tabs.map((Tab tab) {
//           final String label = tab.text!.toLowerCase();
//           return label == "azkar"
//               ? const BodyAzkarScreen()
//               : const BodyDoaaScreen();
//         }).toList(),
//       ),
//     );
//   }
// }

import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_tapbar.dart';
import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/azkar_doaa_select_sliver_context.dart';

class AzkarDoaaScreen extends GetView<AzkarDoaaController> {
  const AzkarDoaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      CustomScrollView(
        slivers: [
          SliverAppBarTabWidget(
            title: "Azkar and Doaa",
            tabs: controller.tabs,
            tabController: controller.tabController,
          ),
          const AzkarDoaaSelectSliver(),
        ],
      ),
    );
  }
}
