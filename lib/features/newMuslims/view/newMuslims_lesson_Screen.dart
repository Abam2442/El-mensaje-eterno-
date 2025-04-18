import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/controller/newMuslims_controller.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/view/newMuslims_nestedTopics_screen.dart';

import '../../../core/widgets/custom_listTile.dart';

class NewMuslimsLessonScreen extends StatelessWidget {
  NewMuslimsLessonScreen(
      {required this.courseIndex, required this.lessonIndex, super.key});
  final int courseIndex;
  final int lessonIndex;
  final NewMuslimsController newMuslimsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.kGoldenColor,
          ),
          backgroundColor: AppColors.kPrimaryColor,
          title: Text(
            '${newMuslimsController.newMuslimsModel.courses![courseIndex].lessons![lessonIndex].header}',
            style: Styles.textStyle20Golden,
          ),
        ),
        body: Container(
          color: AppColors.kscandryGreen,
          child: Padding(
              padding: 10.aEdge,
              child: ListView.builder(
                  itemCount: newMuslimsController
                      .newMuslimsModel
                      .courses![courseIndex]
                      .lessons![lessonIndex]
                      .nestedTopics!
                      .length,
                  itemBuilder: (context, i) => CustomListTile(
                        index: i,
                        title:
                            '${newMuslimsController.newMuslimsModel.courses![courseIndex].lessons![lessonIndex].nestedTopics![i].title}',
                        onTap: () {
                          Get.to(() => NewMuslimsNestedTopicsScreen(
                              courseIndex: courseIndex,
                              lessonIndex: lessonIndex,
                              nestedTopicsIndex: i));
                        },
                      ))),
        ));
  }
}
