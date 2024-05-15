import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/controller/advanced_learning_controller.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/widgets/custom_appBar.dart';
import 'package:hiwayda_oracion_islamica/features/advanced_learning/presentation/widgets/item%20_card.dart';

class AdvancedSiteMediaMainScreen extends StatelessWidget {
  const AdvancedSiteMediaMainScreen(this.page, {super.key});
  final Map page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          Custom_AppBar(
            title: page['title'],
            isSearch: false,
            isPinned: true,
          ),
          GetBuilder<Advanced_LearningController>(
            builder: (controller) => SliverToBoxAdapter(
              child: Column(
                children: [
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
                          itemCount: page['targetScreen'].length,
                          itemBuilder: (context, index) {
                            final selectedPage = page['targetScreen'][index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                  selectedPage['targetScreen'],
                                );
                              },
                              child: Item_Card(
                                hasCopyRights: true,
                                titleSite: selectedPage['title'],
                                subtitle: selectedPage['description'],
                                copyRights: selectedPage['copyRight'] ?? '',
                                link: selectedPage['link'] ?? '',
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
