// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_qa_sub_screens/islam_fluffy_topic_view.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_qa_sub_screens/islamic_all_quesion.dart';

import '../../../../advanced_learning/presentation/widgets/item _card.dart';
import '../../../data/models/islam_qa.dart';
import '../../widget/app_bar_custom.dart';
import 'islam_purple_topic.dart';

class IslamPurpleTopicView extends StatelessWidget {
  final PurpleSubTopic islamQaSubTopic;
  final title;
  const IslamPurpleTopicView(
      {super.key, required this.title, required this.islamQaSubTopic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(title: title).customAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [
              islamQaSubTopic.subTopics == null ||
                      islamQaSubTopic.subTopics!.isEmpty
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        Get.to(() => IslamFluffyTopic(
                              islamQaSubTopic: islamQaSubTopic.subTopics,
                              title: islamQaSubTopic.name,
                            ));
                      },
                      child: const Item_Card(titleSite: 'Sub Topics')),
              islamQaSubTopic.questions.isEmpty
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        Get.to(() => IslamAllQuestions(
                              islamQaSubTopic: islamQaSubTopic.questions,
                              title: islamQaSubTopic.name,
                            ));
                      },
                      child: const Item_Card(titleSite: 'Questions')),
            ],
          ),
        ));
  }
}
