import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/data/models/course_model.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/controller/non_muslim_controller.dart';
import 'package:hiwayda_oracion_islamica/features/sites/presentation/widget/artical_custom.dart';

class NonMuslimSubTopicsScreen extends GetView<NonMuslimController> {
  final List<IslamNestedTopic> topic;
  final String title;

  const NonMuslimSubTopicsScreen(
      {super.key, required this.topic, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(
            title: title,
            // isSearch: true,
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
                itemCount: topic.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.kPrimaryColor,
                    child: ListTile(
                      onTap: () {
                        Get.to(
                            () => ArticalCustom(
                                  title: topic[index].title,
                                  dataText: topic[index].body,
                                ),
                            transition: Transition.cupertino);
                      },
                      leading: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: VerticalDivider(
                          thickness: 2,
                          color: AppColors.white,
                        ),
                      ),
                      title: Text(
                        topic[index].title,
                        style: Styles.textStyle18Godlen,
                      ),
                      subtitle: Text(
                        topic[index].body,
                        maxLines: 1,
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
