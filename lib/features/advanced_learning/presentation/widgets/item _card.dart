// ignore_for_file: camel_case_types

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/advanced_learning_controller.dart';
import 'pub_up_custom.dart';

class Item_Card extends StatelessWidget {
  final String titleSite;
  final String subtitle;
  final String copyRights;
  final String link;

  final bool hasCopyRights;
  const Item_Card({
    super.key,
    required this.titleSite,
    this.subtitle = 'Learning Islam',
    this.copyRights = '',
    this.link = '',
    this.hasCopyRights = false,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(Advanced_LearningController());
    return GetBuilder<Advanced_LearningController>(
        builder: (controller) => Card(
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
                  titleSite,
                  style: Styles.textStyle18Godlen,
                ),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    !hasCopyRights
                        ? Container()
                        : IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return PubUpCustom(
                                      body: copyRights,
                                      link: link,
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.info,
                              color: AppColors.white,
                            )),
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
            ));
  }
}
