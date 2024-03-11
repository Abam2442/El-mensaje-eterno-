import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/learning_islam_controller.dart';
import '../../widget/app_bar_custom.dart';
import '../../widget/artical_custom.dart';
import '../../widget/inkwell_custom.dart';

class LearningTitleLessonScreen extends StatelessWidget {
  final int itemCount;
  final List dataText;
  const LearningTitleLessonScreen({
    super.key,
    required this.itemCount,
    required this.dataText,
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
                        dataText: dataText[index].lessonName,
                        onTap: () {
                          Get.to(ArticalCustom(
                            dataText: dataText[index].lessonBody,
                          ));
                        },
                      );
                    })))));
  }
}
