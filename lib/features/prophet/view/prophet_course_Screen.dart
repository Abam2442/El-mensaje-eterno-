import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/features/prophet/controller/prophet_controller.dart';

import '../../../core/widgets/custom_listTile.dart';
import 'prophet_lesson_Screen.dart';

class ProphetCourseScreen extends StatelessWidget {
  ProphetCourseScreen({required this.index, super.key});
  final int index;
  ProphetController prophetController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      child: Padding(
          padding: 10.aEdge,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                    '${prophetController.prophetModel.courses![index].description}',
                    style: Styles.textStyle16Golden,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: context.height * 0.8,
                  child: ListView.builder(
                      itemCount: prophetController
                          .prophetModel.courses![index].lessons!.length,
                      itemBuilder: (context, i) => CustomListTile(
                            index: i,
                            title:
                                '${prophetController.prophetModel.courses![index].lessons![i].title}',
                            onTap: () {
                              Get.to(() => ProphetLessonScreen(
                                  courseIndex: index, lessonIndex: i));
                            },
                          )),
                )
              ],
            ),
          )),
    );
  }
}
