import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../features/home/presentation/widgets/pray_time_widget_item.dart';
import 'package:flutter/material.dart';

class PrayTimeWidgetSectionHomeScreen extends StatelessWidget {
  // final HomeController homeController = Get.put(HomeController());
  const PrayTimeWidgetSectionHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    // print(homeController.current);
    return Column(
      children: [
        controller.timingsData.timings.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PrayTimeWidgetItem(
                      isEnabled: false,
                      prayIcon: AppAssets.moonFajrIcon,
                      prayName: 'Fajr',
                      prayTime: controller.timingsData.timings['Fajr']),
                  PrayTimeWidgetItem(
                      isEnabled: false,
                      prayIcon: AppAssets.sunDuhurIcon,
                      prayName: 'Duhur',
                      prayTime: controller.timingsData.timings['Dhuhr']),
                  PrayTimeWidgetItem(
                      isEnabled: false,
                      prayIcon: AppAssets.sunAsrIcon,
                      prayName: 'Asr',
                      prayTime: controller.timingsData.timings['Asr']),
                  PrayTimeWidgetItem(
                      isEnabled: false,
                      prayIcon: AppAssets.sunMaghribIcon,
                      prayName: 'Maghrib',
                      prayTime: controller.timingsData.timings['Maghrib']),
                  PrayTimeWidgetItem(
                      isEnabled: false,
                      prayIcon: AppAssets.moonIshaIcon,
                      prayName: 'Isha',
                      prayTime: controller.timingsData.timings['Isha']),
                ],
              ),
        const SizedBox(
          height: 35,
        ),
      ],
    );
  }
}
