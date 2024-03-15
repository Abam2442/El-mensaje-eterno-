
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/utils/components/appbar/home_appbar.dart';
import 'widgets/pray_time_widget_section_home_screen.dart';
import 'widgets/sections_widgets_home_screen.dart';
import 'widgets/time_and_hour_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TimeAndHourWidget(),
            const SizedBox(
              height: 12,
            ),
            PrayTimeWidgetSectionHomeScreen(),
            SectionswidgetsHomeScreen(data: homeController.homeCardsData),
          ],
        ),
      ),
    );
  }
}
