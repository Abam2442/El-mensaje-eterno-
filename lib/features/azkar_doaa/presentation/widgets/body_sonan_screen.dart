import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../sites/presentation/widget/inkwell_custom.dart';
import 'day_night_sonan_screen.dart';
import 'timed_sonan_screen.dart';
import 'untimed_sonan_screen.dart';

class BodySonanScreen extends StatelessWidget {
  const BodySonanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkwellCustom(
          catigory: false,
          // iconData: controller.icons[index],
          dataText: 'أذكار اليوم والليلة',
          onTap: () {
            Get.to(() => const DayNightSonanScreen());
          },
        ),
        InkwellCustom(
          catigory: false,
          // iconData: controller.icons[index],
          dataText: 'سنن موقوتة',
          onTap: () {
            Get.to(() => const TimedSonanScreen());
          },
        ),
        InkwellCustom(
          catigory: false,
          // iconData: controller.icons[index],
          dataText: 'سنن غير موقوتة',
          onTap: () {
            Get.to(() => const UnTimedSonanScreen());
          },
        )
        // Item_Card(titleSite: ''),
        // Item_Card(titleSite: 'سنن موقوتة'),
        // Item_Card(titleSite: 'سنن غير موقوتة'),
      ],
    );
  }
}
