// import 'package:elresala/features/advanced_learning/presentation/widgets/item%20_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/search_field_widget.dart';

import '../../../../advanced_learning/presentation/widgets/item _card.dart';
import '../../controller/islam_guide_1_controller.dart';
import '../../widget/app_bar_custom.dart';
import 'islam_guide_chapter_view.dart';

class IslamGuide1Screen extends StatelessWidget {
  const IslamGuide1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Islam Guide 1').customAppBar(context),
      body: GetBuilder<IslamGuide1ControllerImp>(
        builder: (c) {
          return Column(
            children: [
              SearchFieldWidget(
                formState: c.formState,
                onSubmitted: (val) => c.searchFun(val),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: c.articals.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => IslamGuide1ChaptersScreen(
                              chapters: c.articals[index].chapters,
                              title: 'Chapter ${index + 1}',
                            ));
                      },
                      child: Item_Card(
                        titleSite: 'Chapter ${index + 1}',
                        // subtitle: '',
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
