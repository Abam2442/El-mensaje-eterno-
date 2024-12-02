import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_enums.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/controller/zad_da3ia/zad_daiya_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/zad_da3ia/zad_da3ia_topics_screen.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/screen/zad_da3ia/zad_daeia_sub_topic_screen.dart';

class ZadDaeiaScreen extends StatelessWidget {
  const ZadDaeiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // reverse: true,
      slivers: [
        const SliverAppBarWidget(
          // isSearch: true,
          title: "زاد الداعية ",
          isPinned: true,
        ),
        SliverToBoxAdapter(
          child: GetBuilder<ZadDaeiaController>(builder: (c) {
            if (c.topics.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
                // child: Text(c.topics.toString()),
              );
            }
            // debugPrint(c.topics.toString());
            var topics = c.topics;

            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (topics[index].nestedTopics.isNotEmpty) {
                      Get.to(
                        () => ZadDaeiaSubTopicScreen(
                          topic: topics[index].nestedTopics,
                          title: topics[index].sectionName,
                        ),
                        transition: Transition.cupertino,
                      );
                    } else {
                      Get.to(
                        () => ZadDa3iaTopicsScreen(
                          topics: topics[index].topics,
                          title: topics[index].sectionName,
                        ),
                        transition: Transition.cupertino,
                      );
                    }
                  },
                  child: Card(
                    color: AppColors.kPrimaryColor,
                    child: ListTile(
                      leading: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: VerticalDivider(
                          thickness: 2,
                          color: AppColors.white,
                        ),
                      ),
                      title: Text(
                        topics[index].sectionName,
                        style: Styles.textStyle18Godlen,
                      ),
                      subtitle: Text(
                        topics[index].nestedTopics.isNotEmpty
                            ? topics[index].sectionName
                            : topics[index].topics.first.header,
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
            );
          }),
        ),
      ],
    );
  }
}
