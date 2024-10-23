import 'package:flutter/material.dart';
import 'widgets/pray_time_widget_section_home_screen.dart';
import 'widgets/time_and_hour_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // HomeController controller = Get.find();
    return const SingleChildScrollView(
      child: Column(
        children: [
          TimeAndHourWidget(),
          SizedBox(
            height: 12,
          ),
          PrayTimeWidgetSectionHomeScreen(),
        ],
      ),
    );
  }
}
