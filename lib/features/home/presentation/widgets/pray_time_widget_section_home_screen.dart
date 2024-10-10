import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../features/home/presentation/widgets/pray_time_widget_item.dart';
import 'package:flutter/material.dart';

class PrayTimeWidgetSectionHomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  PrayTimeWidgetSectionHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    print(homeController.current);
    return Obx(()=> homeController.isLoading.value?
        const CircularProgressIndicator():
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => PrayTimeWidgetItem(
                  isEnabled: (homeController.current == 'fajr')? true : false,
                  prayIcon: AppAssets.moonFajrIcon,
                  prayName: 'Fajr',
                  prayTime: homeController.fajrTime.value ),
            ),
            Obx(() => PrayTimeWidgetItem(
                isEnabled: (homeController.current == 'dhuhr')? true : false,
                prayIcon: AppAssets.sunDuhurIcon,
                prayName: 'Duhur',
                prayTime: homeController.duhurTime.value)),
            Obx(() => PrayTimeWidgetItem(
                isEnabled: (homeController.current == 'asr')? true : false,
                prayIcon: AppAssets.sunAsrIcon,
                prayName: 'Asr',
                prayTime: homeController.asrTime.value)),
            Obx(() => PrayTimeWidgetItem(
                isEnabled: (homeController.current == 'maghrib')? true : false,
                prayIcon: AppAssets.sunMaghribIcon,
                prayName: 'Maghrib',
                prayTime: homeController.maghribTime.value)),
            Obx(() => PrayTimeWidgetItem(
                isEnabled: (homeController.current == 'isha')? true : false,
                prayIcon: AppAssets.moonIshaIcon,
                prayName: 'Isha',
                prayTime: homeController.ishaTime.value)),
          ],
        ),
        const SizedBox(
          height: 35,
        ),
      ],
    ));
  }
}
