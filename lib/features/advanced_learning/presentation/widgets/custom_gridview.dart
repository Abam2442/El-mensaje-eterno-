// ignore_for_file: camel_case_types

import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/advanced_learning_controller.dart';

class Item_GridView extends StatelessWidget {
  const Item_GridView({super.key});

  @override
  Widget build(BuildContext context) {
    AdvancedLearningController controller =
        Get.put(AdvancedLearningController());
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.titlePart.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.changeSelectedPart(index);
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  controller.titlePart[index],
                  style: const TextStyle(
                      color: AppColors.kGoldenColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              controller.selectedPart == index
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width:
                          controller.titlePart[index].toString().length * 7.0,
                      height: 2,
                      color: AppColors.kGoldenColor,
                    )
                  : Container()
            ],
          ),
        );
      },
    );
  }
}
