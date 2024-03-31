// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_qa_sub_screens/islam_qa_question_view.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_qa_sub_screens/islam_subtopic_view.dart';

import '../../../../advanced_learning/presentation/widgets/item _card.dart';
import '../../../data/models/islam_qa.dart';
import '../../widget/app_bar_custom.dart';

class IslamAllQuestions extends StatelessWidget {
  final List<dynamic> islamQaSubTopic;
  final title;
  const IslamAllQuestions(
      {super.key, required this.islamQaSubTopic, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(title: title).customAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
            itemCount: islamQaSubTopic.isEmpty ? 0 : islamQaSubTopic.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => IslamQAQuestionView(
                        question: islamQaSubTopic[index],
                        title: 'Quesion No ${index + 1}',
                      ));
                },
                child: Item_Card(
                  titleSite: 'Quesion No ${index + 1}',
                  // subtitle: '',
                ),
              );
            },
          ),
        ));
  }
}
