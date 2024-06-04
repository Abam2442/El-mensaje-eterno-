import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/controller/non_muslim_controller.dart';
import 'package:hiwayda_oracion_islamica/features/non_muslim/presentation/screens/non_muslim_topic_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NonMuslimSectionScreen extends GetView<NonMuslimController> {
  const NonMuslimSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          const SliverAppBarWidget(
            title: 'Courses for Non Muslims',
            isPinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: GetBuilder<NonMuslimController>(builder: (c) {
                if (c.hadithes.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var topics = c.hadithes;

                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: MediaQuery.of(context).size.height),
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(
                        () => NonMuslimTopicsScreen(
                          topics: topics[index].topics,
                          title: topics[index].sectionName,
                        ),
                        transition: Transition.cupertino,
                      ),
                      child: Card(
                        color: AppColors.kGreenColor,
                        child: ListTile(
                          // onTap: () {
                          //   Get.to(() =>
                          //       NonMuslimTopicsScreen(topic: topics[index].topics));
                          // },
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
                            topics[index].topics.first.header,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.info,
                                color: AppColors.white,
                              ),
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
          ),
        ],
      ),
    );
  }
}
