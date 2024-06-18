import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_tapbar.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadith_webside_select_sliver_context.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';

class HadithScreen extends GetView<HadithController> {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HadithController());
    Get.put(QuranController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarTabWidget(
            title: "Hadith",
            tabs: controller.tabs,
            tabController: controller.tabController,
          ),
          SliverToBoxAdapter(
            child: SearchFieldWidget(
              text: 'Buscar en hadices',
              formState: controller.formState,
              onSubmitted: (val) => controller.searchFun(val),
            ),
          ),
          const HadithWebsideSelectSliver(),
        ],
      ),
    );
  }
}
