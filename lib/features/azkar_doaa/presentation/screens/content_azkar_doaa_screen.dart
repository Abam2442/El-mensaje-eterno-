// import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
// import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
// import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/widgets/body_content_azkar_screen.dart';
// import 'package:hiwayda_oracion_islamica/features/azkar_doaa/presentation/widgets/body_content_doaa_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ContentAzkarDoaasScreen extends GetView<AzkarDoaaController> {
//   const ContentAzkarDoaasScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.kPrimaryColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.kPrimaryColor,
//         titleTextStyle: const TextStyle(
//           color: AppColors.kGoldenColor,
//           fontWeight: FontWeight.bold,
//           fontSize: 20,
//           fontFamily: 'Poppins',
//           letterSpacing: 1.5,
//           height: 1.5,
//           decoration: TextDecoration.none,
//           decorationColor: AppColors.kWhiteColor,
//           decorationStyle: TextDecorationStyle.solid,
//           decorationThickness: 1,
//         ),
//         title: Text(Get.arguments['title']),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Get.arguments['label'] == "azkar"
//             ? const BodyContentAzkarScreen()
//             : const BodyContentDoaaScreen(),
//       ),
//     );
//   }
// }

import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/body_content_azkar_screen.dart';
import '../widgets/body_content_doaa_screen.dart';

class ContentAzkarDoaasScreen extends StatelessWidget {
  const ContentAzkarDoaasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String title = Get.arguments["title"];
    Get.put(QuranController());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBarWidget(
                  title: title,
                  backgroundColor: AppColors.kPrimaryColor,
                  iconColor: const Color.fromRGBO(42, 44, 65, 1),
                ),
                Get.arguments['label'] == "azkar"
                    ? const BodyContentAzkarScreen()
                    : const BodyContentDoaaScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
