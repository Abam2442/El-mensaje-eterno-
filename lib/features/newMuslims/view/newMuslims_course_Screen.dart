import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/custom_appbar.dart';
import 'package:hiwayda_oracion_islamica/core/widgets/primary_shimmer.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/controller/newMuslims_controller.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/view/new_muslims_category_screen.dart';

import '../../../core/widgets/custom_listTile.dart';
import 'newMuslims_lesson_Screen.dart';

class NewMuslimsCourseScreen extends StatelessWidget {
  NewMuslimsCourseScreen({required this.index, super.key});
  final int index;
  final NewMuslimsController newMuslimsController =
      Get.put(NewMuslimsController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.kWhiteColor,
          appBar:
              const CustomAppbar(title: 'Curso para el nuevo musulmán', tabs: [
            Tab(
              text: 'Niveles',
            ),
            Tab(
              text: 'Categorías',
            ),
          ]),
          body: TabBarView(children: [
            Obx(() => newMuslimsController.isLoading.value
                ? ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => PrimaryShimmer.rectangle(
                      height: Get.height * 0.09,
                      color: AppColors.kGreenColor,
                      border: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemCount: 8,
                  )
                : Container(
                    color: AppColors.background,
                    child: Padding(
                        padding: 10.aEdge,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                  '${newMuslimsController.newMuslimsModel.courses![index].description}',
                                  style: Styles.textStyle20Black,
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: context.height * 0.8,
                                child: ListView.builder(
                                    itemCount: newMuslimsController
                                        .newMuslimsModel
                                        .courses![index]
                                        .lessons!
                                        .length,
                                    itemBuilder: (context, i) => CustomListTile(
                                          index: i,
                                          title:
                                              '${newMuslimsController.newMuslimsModel.courses![index].lessons![i].header}',
                                          onTap: () {
                                            Get.to(() => NewMuslimsLessonScreen(
                                                courseIndex: index,
                                                lessonIndex: i));
                                          },
                                        )),
                              )
                            ],
                          ),
                        )),
                  )),
            Obx(() => newMuslimsController.isLoading1.value
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    color: AppColors.background,
                    child: Padding(
                        padding: 10.aEdge,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: context.height * 0.8,
                                child: ListView.builder(
                                    itemCount: newMuslimsController
                                        .categorySpModel.length,
                                    itemBuilder: (context, i) => CustomListTile(
                                          index: i,
                                          title:
                                              '${newMuslimsController.categorySpModel[i].name}',
                                          onTap: () {
                                            Get.to(() =>
                                                NewMuslimsCategoryScreen(
                                                  CategoryIndex: i,
                                                  title: newMuslimsController
                                                      .categorySpModel[i].name!,
                                                ));
                                          },
                                        )),
                              )
                            ],
                          ),
                        )),
                  ))
          ]),
        ));
  }
}
