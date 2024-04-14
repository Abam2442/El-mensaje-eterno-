import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/controller/non_muslim_controller.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/screens/non_muslim_sub_topic_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NonMuslimTopicsScreen extends GetView<NonMuslimController> {
  final List<IslamTopic> topics;
  final String title;
  const NonMuslimTopicsScreen(
      {super.key, required this.topics, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(
            // isSearch: true,
            title: title,
            isPinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(
                  10,
                  // bottom: MediaQuery.of(context).size.height
                ),
                // shrinkWrap: true,
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => NonMuslimSubTopicsScreen(
                          topic: topics[index].nestedTopics,
                          title: topics[index].header,
                        ),
                        transition: Transition.cupertino,
                      );
                    },
                    child: Card(
                      color: AppColors.kGreenColor,
                      child: ListTile(
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: VerticalDivider(
                            thickness: 2,
                            color: AppColors.white,
                          ),
                        ),
                        title: Text(
                          topics[index].header,
                          style: Styles.textStyle18Godlen,
                        ),
                        subtitle: Text(
                          topics[index].nestedTopics.first.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // const Icon(
                            //   Icons.info,
                            //   color: AppColors.white,
                            // ),
                            Container(
                              width: 10,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
