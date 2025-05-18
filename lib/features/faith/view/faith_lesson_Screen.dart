import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/copy_button.dart';
import 'package:hiwayda_oracion_islamica/features/faith/controller/faith_controller.dart';

class FaithLessonScreen extends StatelessWidget {
  const FaithLessonScreen(
      {required this.courseIndex, required this.lessonIndex, super.key});
  final int courseIndex;
  final int lessonIndex;
  @override
  Widget build(BuildContext context) {
    FaithController faithController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      appBar: AppBar(
          backgroundColor: AppColors.kscandryGreen,
          title: Text(
            '${faithController.faithModel.courses![courseIndex].lessons![lessonIndex].title}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          actions: [
            CopyButton(
                text: faithController
                    .faithModel.courses![courseIndex].lessons![lessonIndex].body
                    .toString()),
          ]),
      body: Container(
        color: AppColors.kPrimaryColor,
        child: Padding(
            padding: 20.aEdge,
            child: SingleChildScrollView(
                child: Text(
              '${faithController.faithModel.courses![courseIndex].lessons![lessonIndex].body}',
              style: Styles.textStyle18Golden,
            ))),
      ),
    );
  }
}
