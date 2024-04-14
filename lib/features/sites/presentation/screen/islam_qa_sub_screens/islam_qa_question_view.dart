// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/services/easy_loader_service.dart';

import '../../../data/models/islam_qa.dart';
import '../../widget/app_bar_custom.dart';

// import 'package:flutter/material.dart';

class IslamQAQuestionView extends StatelessWidget {
  final Question question;
  final String title;
  const IslamQAQuestionView(
      {super.key, required this.question, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(title: title, actions: [
          IconButton(
              onPressed: () async {
                var data = ClipboardData(text: question.answer);
                await Clipboard.setData(data);
                EasyLoaderService.showToast(message: "Copied");
              },
              icon: const Icon(
                Icons.copy,
                color: AppColors.kWhiteColor,
              )),
        ]).customAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                'Question:',
                style: AppTextStyles.h3.copyWith(color: AppColors.kGreenColor),
              ),
              SelectableText(
                question.questionText,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Answer:',
                style: AppTextStyles.h3.copyWith(color: AppColors.kGreenColor),
              ),
              SelectableText(
                question.answer,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ));
  }
}
