import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/pilers/controller/pilers_controller.dart';

import '../../../core/widgets/custom_listTile.dart';
import 'pilers_lesson_Screen.dart';

class PilersCourseScreen extends StatelessWidget {
  PilersCourseScreen({required this.index, super.key});

  final int index;
  PilersController pilersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      child: Padding(
        padding: 10.aEdge,
        child: ListView.builder(
            itemCount:
                pilersController.pilersModel.courses![index].lessons!.length,
            itemBuilder: (context, i) => CustomListTile(
                  index: i,
                  title:
                      '${pilersController.pilersModel.courses![index].lessons![i].title}',
                  onTap: () {
                    Get.to(() =>
                        PilersLessonScreen(courseIndex: index, lessonIndex: i));
                  },
                )),
      ),
    );
  }
}
