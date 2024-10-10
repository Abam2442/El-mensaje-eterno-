import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadithenc_hadith_select_sliver_context.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';

import '../widgets/sunnah_hadith_select_sliver_context.dart';

class BookHadithesScreen extends GetView<HadithController> {
  final int index;
  final String webside, name;
  const BookHadithesScreen(this.index, this.webside, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    controller.isBack.value = true;
    return Scaffold(
      body: ListView(
        children: [
          // SliverToBoxAdapter(
          //   child: AppBarCustom(title: Get.arguments['title'])
          //       .customAppBar(context),
          // ),
          webside == "sunnah"
              ? SunnahBookSelectSliver(index, name)
              : const HadithencCategorySelectSliver(),
        ],
      ),
    );
  }
}
