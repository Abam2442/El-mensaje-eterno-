import 'dart:async';

import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TimeAndHourWidget extends StatelessWidget {
  TimeAndHourWidget({
    super.key,
  });

  Timer? timer;
  HomeController homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    print('TimeAndHourWidget build');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          homeController.getHijriFormat(),
          style: Styles.textStyle18Golden,
        ),
        TimerBuilder.periodic(const Duration(seconds: 1), builder: (context) {
          return Text(
            homeController.getSystemTime(),style: Styles.textStyle48Golden,
          );
          }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Obx(()=>(homeController.isLoading.value)?
              const CircularProgressIndicator():
            Text('${homeController.next} ',
              style: Styles.textStyle18Golden.copyWith(color: AppColors.danger),
            )),
            _buildCountDown(),
            const Text(
              ' Left ',
              style: Styles.textStyle18Golden,
            ),
          ],
        )
      ],
    );
  }
  Widget _buildCountDown() {
    return Obx(() => Text(
      '${twoDigits(homeController.duration.value.inHours.remainder(60))}:${twoDigits(homeController.duration.value.inMinutes.remainder(60))}:${twoDigits(homeController.duration.value.inSeconds.remainder(60))}',
      style: AppTextStyles.h3.copyWith(color: AppColors.yLightGreyColor),
    ));
  }
  String twoDigits(int n) => n.toString().padLeft(2, '0');
}
