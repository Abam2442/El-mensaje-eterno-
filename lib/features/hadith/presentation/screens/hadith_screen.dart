import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_webside_select_sliver_context.dart';
import 'package:flutter/material.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HadithController.instance;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        // ElevatedButton(
        //   onPressed: () {
        //     controller.testFun();
        //   },
        //   child: Text('test'),
        // ),
        TabBar(
          tabs: controller.tabs,
          controller: controller.tabController,
          labelColor: AppColors.black,
          unselectedLabelColor: const Color(0xFFffE4AC),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: AppColors.kGreenColor,
        ),
        const HadithWebsideSelectSliver(),
      ],
    );
  }
}
