import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/pray_time_widget_section_home_screen.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/widgets/sections_widgets_home_screen.dart';

class NewMuslimHomeScreen extends StatelessWidget {
  const NewMuslimHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController.instance;

    return SingleChildScrollView(
      child: GetBuilder<HomeController>(builder: (context) {
        return Column(
          children: [
            const PrayTimeWidgetSectionHomeScreen(),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFbac2b9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SectionswidgetsHomeScreen(
                  data: homeController.newMuslimHomeCardsDataNewList),
            ),
          ],
        );
      }),
    );
  }
}
