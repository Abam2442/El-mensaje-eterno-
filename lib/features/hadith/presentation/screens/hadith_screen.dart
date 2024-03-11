import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_tapbar.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_webside_select_sliver_context.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HadithScreen extends GetView<HadithController> {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      CustomScrollView(
        slivers: [
          SliverAppBarTabWidget(
            title: "Hadith",
            tabs: controller.tabs,
            tabController: controller.tabController,
          ),
          const HadithWebsideSelectSliver(),
        ],
      ),
    );
  }
}
