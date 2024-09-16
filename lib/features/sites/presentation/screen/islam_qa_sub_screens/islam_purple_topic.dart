// import 'package:elresala/features/sites/data/models/islam_qa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hiwayda_oracion_islamica/core/widgets/item%20_card.dart';
import '../../../data/models/islam_qa.dart';
import '../../widget/app_bar_custom.dart';
import 'islam_purple_topic_view.dart';

class IslamPurpleTopic extends StatelessWidget {
  final List<PurpleSubTopic>? islamQaSubTopic;
  final title;
  const IslamPurpleTopic(
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
                  Get.to(() => IslamPurpleTopicView(
                        islamQaSubTopic: islamQaSubTopic![index],
                        title: islamQaSubTopic![index].name,
                      ));
                },
                child: ItemCard(
                  titleSite: islamQaSubTopic![index].name,
                  // subtitle: '',
                ),
              );
            },
          ),
        ));
  }
}
