import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/mooamalat/controller/mooamalat_controller.dart';

import 'description_screen.dart';
import 'mooamalat_lesson_Screen.dart';
import '../../../core/widgets/custom_listTile.dart';

class MooamalatCourseScreen extends StatelessWidget {
  MooamalatCourseScreen({required this.index, super.key});
  final int index;
  MooamalatController mooamalatController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      child: Padding(
          padding: 10.aEdge,
          child: Column(
            children: [
              if ('${mooamalatController.mooamalatModel.courses![index].description}' !=
                  '')
                CustomListTile(
                  title: 'Description',
                  onTap: () {
                    Get.to(() => DescriptionScreen(
                          des:
                              '${mooamalatController.mooamalatModel.courses![index].description}',
                        ));
                  },
                ),
              Expanded(
                child: ListView.builder(
                    itemCount: mooamalatController
                        .mooamalatModel.courses![index].lessons!.length,
                    itemBuilder: (context, i) => CustomListTile(
                          index: i,
                          title:
                              '${mooamalatController.mooamalatModel.courses![index].lessons![i].title}',
                          onTap: () {
                            Get.to(() => MooamalatLessonScreen(
                                courseIndex: index, lessonIndex: i));
                          },
                        )),
              )
            ],
          )),
    );
  }
}
