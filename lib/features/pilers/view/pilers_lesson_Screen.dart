import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/copy_button.dart';
import 'package:hiwayda_oracion_islamica/features/pilers/controller/pilers_controller.dart';

class PilersLessonScreen extends StatelessWidget {
  PilersLessonScreen(
      {required this.courseIndex, required this.lessonIndex, super.key});
  final int courseIndex;
  final int lessonIndex;
  PilersController pilersController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${pilersController.pilersModel.courses![courseIndex].lessons![lessonIndex].title}'),
          actions: [
            CopyButton(
                text: pilersController.pilersModel.courses![courseIndex]
                    .lessons![lessonIndex].body
                    .toString()),
          ]),
      body: Container(
        color: AppColors.kPrimaryColor,
        child: Padding(
            padding: 20.aEdge,
            child: SingleChildScrollView(
                child: Text(
              '${pilersController.pilersModel.courses![courseIndex].lessons![lessonIndex].body}',
              style: Styles.textStyle18Golden,
            ))),
      ),
    );
  }
}
