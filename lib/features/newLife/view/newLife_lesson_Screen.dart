import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/copy_button.dart';
import 'package:hiwayda_oracion_islamica/features/newLife/controller/newLife_controller.dart';

class NewLifeLessonScreen extends StatelessWidget {
  NewLifeLessonScreen(
      {required this.courseIndex, required this.lessonIndex, super.key});
  final int courseIndex;
  final int lessonIndex;
  NewLifeController newLifeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.kGoldenColor,
          ),
          backgroundColor: AppColors.kPrimaryColor,
          title: Text(
            '${newLifeController.newLifeModel.courses![courseIndex].lessons![lessonIndex].title}',
            style: Styles.textStyle20Golden,
          ),
          actions: [
            CopyButton(
                text: newLifeController.newLifeModel.courses![courseIndex]
                    .lessons![lessonIndex].body
                    .toString()),
          ]),
      body: Container(
        color: AppColors.kPrimaryColor,
        child: Padding(
            padding: 20.aEdge,
            child: SingleChildScrollView(
                child: Text(
              '${newLifeController.newLifeModel.courses![courseIndex].lessons![lessonIndex].body}',
              style: Styles.textStyle18Golden,
            ))),
      ),
    );
  }
}
