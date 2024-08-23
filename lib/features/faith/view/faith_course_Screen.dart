import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/faith/controller/faith_controller.dart';

import '../../../core/widgets/custom_listTile.dart';
import 'description_screen.dart';
import 'faith_lesson_Screen.dart';

class FaithCourseScreen extends StatelessWidget {
  final int index;
  const FaithCourseScreen({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    FaithController faithController = Get.find();
    return Container(
      color: AppColors.kPrimaryColor,
      child: Padding(
          padding: 10.aEdge,
          child: Column(
            children: [
              if ('${faithController.faithModel.courses![index].description}' !=
                  '')
                CustomListTile(
                  title: 'Description',
                  onTap: () {
                    Get.to(() => DescriptionScreen(
                          des:
                              '${faithController.faithModel.courses![index].description}',
                        ));
                  },
                ),
              SizedBox(
                height: context.height * 0.7,
                child: ListView.builder(
                    itemCount: faithController
                        .faithModel.courses![index].lessons!.length,
                    itemBuilder: (context, i) => CustomListTile(
                          index: i,
                          title:
                              '${faithController.faithModel.courses![index].lessons![i].title}',
                          onTap: () {
                            Get.to(() => FaithLessonScreen(
                                courseIndex: index, lessonIndex: i));
                          },
                        )),
              )
            ],
          )),
    );
  }
}
