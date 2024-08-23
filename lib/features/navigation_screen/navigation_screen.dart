import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/home_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/screens/advanced_sites.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/screens/hadith_screen.dart';
import 'package:hiwayda_oracion_islamica/features/navigation_screen/controller/navigation_controller.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/view/new_muslim_home_screen.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/screens/non_muslim_screen.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/screens/quran_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController controller = Get.put(NavigationController());
    return Scaffold(
      backgroundColor: const Color(0xFFbac2b9),
      appBar: const HomeAppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            controller: controller.tabController,
            children: const [
              QuranScreen(),
              NewMuslimHomeScreen(),
              HadithScreen(),
              AdvancedSites()
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(5, 5), blurRadius: 8),
              ],
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TabBar(
              dividerHeight: 0,
              dividerColor: Colors.transparent,
              tabs: [
                ...List.generate(
                  controller.tabBarData.length,
                  (int index) => Tab(
                    text: controller.tabBarData[index].text,
                    icon: SvgPicture.asset(
                      controller.tabBarData[index].image,
                      width: 23,
                    ),
                  ),
                )
              ],
              controller: controller.tabController,
            ),
          ),
        ],
      ),
    );
  }
}
