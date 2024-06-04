// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_qa_sub_screens/islam_flufy_topic_view.dart';

import '../../../../advanced_learning/presentation/widgets/item _card.dart';
import '../../../data/models/islam_qa.dart';
import '../../widget/app_bar_custom.dart';

class IslamFluffyTopic extends StatelessWidget {
  final List<FluffySubTopic>? islamQaSubTopic;
  final title;
  const IslamFluffyTopic(
      {super.key, required this.islamQaSubTopic, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCustom(title: title).customAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
            itemCount: islamQaSubTopic!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => IslamFluffyTopicView(
                        islamQaSubTopic: islamQaSubTopic![index],
                        title: islamQaSubTopic![index].name,
                      ));
                },
                child: Item_Card(
                  titleSite: islamQaSubTopic![index].name,
                  // subtitle: '',
                ),
              );
            },
          ),
        ));
  }
}
