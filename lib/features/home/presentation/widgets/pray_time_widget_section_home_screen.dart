import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../features/home/presentation/widgets/pray_time_widget_item.dart';
import 'package:flutter/material.dart';

class PrayTimeWidgetSectionHomeScreen extends StatelessWidget {
  const PrayTimeWidgetSectionHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: Get.find<HomeController>(),
        builder: (controller) {
          return Column(
            children: [
              Text(
                controller.timingsData.hijriDate,
                style: Styles.textStyle18Golden,
              ),
              controller.timingsData.timings.isEmpty
                  ? const Center(
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
                            prayTime:
                                controller.timingsData.timings['Maghrib']),
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
        });
  }
}
