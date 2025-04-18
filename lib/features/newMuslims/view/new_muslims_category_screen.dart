import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/controller/newMuslims_controller.dart';
import 'package:hiwayda_oracion_islamica/features/newMuslims/view/new_muslims_Topics_Screen.dart';
import 'package:hiwayda_oracion_islamica/features/youtubechannels/presentation/screens/web_view_screen.dart';

import '../../../core/widgets/custom_listTile.dart';

class NewMuslimsCategoryScreen extends StatelessWidget {
  NewMuslimsCategoryScreen(
      {required this.categoryIndex, super.key, required this.title});
  final int categoryIndex;
  final String title;

  final NewMuslimsController newMuslimsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          color: AppColors.kPrimaryColor,
          child: Padding(
              padding: 10.aEdge,
              child: ListView.builder(
                  itemCount: newMuslimsController
                      .categorySpModel[categoryIndex].value!.length,
                  itemBuilder: (context, i) => CustomListTile(
                        index: i,
                        title:
                            '${newMuslimsController.categorySpModel[categoryIndex].value![i].name}',
                        onTap: () {
                          if (newMuslimsController
                                  .categorySpModel[categoryIndex]
                                  .value![i]
                                  .video ==
                              null) {
                            Get.to(() => NewMuslimsTopicsScreen(
                                  CategoryIndex: categoryIndex,
                                  Index: i,
                                  title: newMuslimsController
                                      .categorySpModel[categoryIndex]
                                      .value![i]
                                      .name!,
                                ));
                          } else {
                            Get.to(() => WebViweScreen(
                                  title: newMuslimsController
                                      .categorySpModel[categoryIndex]
                                      .value![i]
                                      .name!,
                                  Urlweb: newMuslimsController
                                      .categorySpModel[categoryIndex]
                                      .value![i]
                                      .video!,
                                ));
                          }
                        },
                      ))),
        ));
  }
}
