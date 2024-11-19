import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/newLife/controller/newLife_controller.dart';

import 'description_screen.dart';
import 'newLife_lesson_Screen.dart';
import '../../../core/widgets/custom_listTile.dart';

class NewLifeCourseScreen extends StatelessWidget {
  NewLifeCourseScreen({required this.index, super.key});
  final int index;
  NewLifeController newLifeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      child: Padding(
          padding: 10.aEdge,
          child: Column(
            children: [
              if ('${newLifeController.newLifeModel.courses![index].description}' !=
                  '')
                CustomListTile(
                  title: 'Description',
                  onTap: () {
                    Get.to(() => DescriptionScreen(
                          des:
                              '${newLifeController.newLifeModel.courses![index].description}',
                        ));
                  },
                ),
              Expanded(
                child: ListView.builder(
                    itemCount: newLifeController
                        .newLifeModel.courses![index].lessons!.length,
                    itemBuilder: (context, i) => CustomListTile(
                          index: i,
                          title:
                              '${newLifeController.newLifeModel.courses![index].lessons![i].title}',
                          onTap: () {
                            Get.to(() => NewLifeLessonScreen(
                                courseIndex: index, lessonIndex: i));
                          },
                        )),
              )
            ],
          )),
    );
  }
}
