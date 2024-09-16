import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/home_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/screens/advanced_sites.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/screens/hadith_screen.dart';
import 'package:hiwayda_oracion_islamica/features/navigation_screen/controller/navigation_controller.dart';
import 'package:hiwayda_oracion_islamica/features/navigation_screen/widgets/buttom_navigation_bar_widget.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/view/new_muslim_home_screen.dart';
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
          const BottomNavigationBarWidget()
        ],
      ),
    );
  }
}
