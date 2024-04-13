// import 'package:elresala/features/advanced_learning/presentation/widgets/item%20_card.dart';
// import 'package:elresala/features/sites/presentation/controller/islam_qa_controller.dart';
// import 'package:elresala/features/sites/presentation/controller/the_key_to_islam_controller.dart';
// import 'package:elresala/features/sites/presentation/screen/islam_qa_sub_screens/islamqa_sub_topics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/islam_qa_sub_screens/islam_subtopic_view.dart';

import '../../../../core/widgets/primary_shimmer.dart';
import '../../../advanced_learning/presentation/widgets/item _card.dart';
import '../controller/islam_qa_controller.dart';
import '../widget/app_bar_custom.dart';
import 'islam_qa_sub_screens/islam_qa_view.dart';
import 'islam_qa_sub_screens/islamqa_sub_topics.dart';

class IslamQAScreen extends StatelessWidget {
  const IslamQAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'islam Q&A').customAppBar(context),
      body: GetBuilder<IslamQAControllerImp>(
        builder: (c) {
          if (c.articals.isEmpty) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    elevation: 0,
                    child: PrimaryShimmer.rectangle(
                      height: Get.height * 0.1,
                      color: const Color.fromARGB(255, 90, 122, 8),
                      border: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: c.articals.length,
              itemBuilder: (context, index) {
                // return ExpansionTile(
                return GestureDetector(
                  onTap: () {
                    Get.to(() => IslamQAView(
                          islamQaSubTopic: c.articals[index],
                          title: c.articals[index].name,
                        ));
                  },
                  child: Item_Card(
                    titleSite: c.articals[index].name,
                    // subtitle: '',
                    // ),
                    // children: [
                    // const Text('topcs'),
                    // if (c.articals[index].subTopics == null)
                    //   Container()
                    // else
                    //   ...c.articals[index].subTopics!
                    //       .map((e) => GestureDetector(
                    //             onTap: () {
                    //               Get.to(() => IslamQASubTopic(
                    //                     islamQaSubTopic:
                    //                         c.articals[index].subTopics,
                    //                     title: c.articals[index].name,
                    //                   ));
                    //             },
                    //             child: Row(
                    //               children: [
                    //                 Text(e.name),
                    //               ],
                    //             ),
                    //           )),
                    // const Text('questions'),
                    // ...c.articals[index].questions.map((e) => GestureDetector(
                    //       onTap: () {
                    //         Get.to(() => IslamQAQuestionView(
                    //               question: c.articals[index].questions[0],
                    //               // title: c.articals[index].name,
                    //             ));
                    //       },
                    //       child: Row(
                    //         children: [
                    //           Text(
                    //             '${e.questionText.substring(0, 20)}...',
                    //             maxLines: 1,
                    //             overflow: TextOverflow.ellipsis,
                    //           ),
                    //         ],
                    //       ),
                    //     ))
                    // ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
