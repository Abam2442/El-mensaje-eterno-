// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/controller/non_muslim_controller.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/screens/non_muslim_topic_screen.dart';

import '../controller/advanced_learning_controller.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/custom_gridview.dart';
import '../widgets/item _card.dart';

class AdvancedSites extends StatelessWidget {
  const AdvancedSites({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Advanced_LearningController());
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          const Custom_AppBar(
            title: 'Advanced Sites',
            isSearch: false,
            isPinned: true,
          ),
          GetBuilder<Advanced_LearningController>(
            builder: (controller) => SliverToBoxAdapter(
              child: Column(
                children: [
                  //
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    height: Get.height / 13,
                    child: Item_GridView(),
                  ),

                  //
                  Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(
                        height: Get.height,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10,
                              bottom: Get.height / 4.5),
                          itemCount:
                              controller.page[controller.selectedPart].length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (controller.selectedPart == 0) {
                                  Get.to(
                                    () => NonMuslimTopicsScreen(
                                      topics: Get.find<NonMuslimController>()
                                          .hadithes[index]
                                          .topics,
                                      title: Get.find<NonMuslimController>()
                                          .hadithes[index]
                                          .sectionName,
                                    ),
                                    transition: Transition.cupertino,
                                  );
                                } else {
                                  Get.toNamed(
                                    controller.page[controller.selectedPart]
                                        [index]['targetScreen'],
                                  );
                                }
                              },
                              child: Item_Card(
                                hasCopyRights:
                                    controller.selectedPart == 0 ? false : true,
                                titleSite:
                                    controller.page[controller.selectedPart]
                                        [index]['title'],
                                subtitle:
                                    controller.page[controller.selectedPart]
                                        [index]['description'],
                                copyRights:
                                    controller.page[controller.selectedPart]
                                            [index]['copyRight'] ??
                                        '',
                                link: controller.page[controller.selectedPart]
                                        [index]['link'] ??
                                    '',
                              ),
                            );
                          },
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
