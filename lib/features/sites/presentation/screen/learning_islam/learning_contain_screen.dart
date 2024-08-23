import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/learning_islam_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/inkwell_custom.dart';
import 'learning_title_lesson_screen.dart';

class LearningContainScreen extends StatelessWidget {
  final int itemCount;
  final List dataText;
  final List onTap;
  const LearningContainScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(LearningIslamControllerImp());
    return Scaffold(
        appBar:
            const AppBarCustom(title: "Learning Islam").customAppBar(context),
        body: GetBuilder<LearningIslamControllerImp>(
            builder: ((controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: dataText[index].subCatigoryName,
                        onTap: () {
                          Get.to(LearningTitleLessonScreen(
                            dataText: dataText[index].lesson,
                            itemCount: dataText[index].lesson.length,
                          ));
                        },
                      );
                    })))));
  }
}
