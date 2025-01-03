import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/kids/controller/kids_controller.dart';
import 'package:hiwayda_oracion_islamica/features/kids/view/question_widget.dart';

class KidsLessonScreen extends StatelessWidget {
  KidsLessonScreen(
      {super.key, required this.courseIndex, required this.lessonIndex});

  final int courseIndex;
  final int lessonIndex;
  KidsController kidsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.kGoldenColor,
        ),
        backgroundColor: AppColors.kPrimaryColor,
        title: Text(
          '${kidsController.kidsModel.titles![courseIndex].title}',
          style: const TextStyle(color: AppColors.kGoldenColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            onPressed: () {
              Get.snackbar('Copied', 'Text copied to clipboard');
              Clipboard.setData(ClipboardData(
                text: kidsController
                    .kidsModel.titles![courseIndex].content![lessonIndex].answer
                    .toString(),
              ));
            },
          ),
        ],
      ),
      body: Container(
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  kidsController.kidsModel.titles![courseIndex].content!.length,
              itemBuilder: (context, i) => QuestionWidget(
                kidsController: kidsController,
                courseIndex: courseIndex,
                lessonIndex: i,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
