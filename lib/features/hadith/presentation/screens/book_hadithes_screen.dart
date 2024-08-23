import 'package:hiwayda_oracion_islamica/features/hadith/presentation/controller/hadith_controller.dart';
import 'package:hiwayda_oracion_islamica/features/hadith/presentation/widgets/hadithenc_hadith_select_sliver_context.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/app_bar_custom.dart';

import '../widgets/sunnah_hadith_select_sliver_context.dart';

class BookHadithesScreen extends GetView<HadithController> {
  final String title, webside, isHadthenic;
  const BookHadithesScreen(this.title, this.webside, this.isHadthenic,
      {super.key});

  @override
  Widget build(BuildContext context) {
    controller.isBack.value = true;
    return PopScope(
        canPop: false,
        onPopInvoked: (isPoped) async {
          if (controller.isBack.isTrue) {
            controller.isBack.value = false;
            // controller.searchTextController.text = "";
            // controller.isSearching.value = false;
            // Navigator.pop(context);
            controller.getbookHadithesName(title);
            controller.update();
          }
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AppBarCustom(title: title).customAppBar(context),
              ),
              webside == "sunnah"
                  ? SunnahBookSelectSliver(title)
                  : const HadithencCategorySelectSliver(),
            ],
          ),
        ));
  }
}
