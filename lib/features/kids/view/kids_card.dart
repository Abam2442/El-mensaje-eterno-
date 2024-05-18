import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:hiwayda_oracion_islamica/features/home/presentation/controller/home_controller.dart';
import 'package:hiwayda_oracion_islamica/features/kids/controller/kids_controller.dart';

import '../model/kids_model.dart';
import 'body_kids_content.dart';


class kidsCard extends StatelessWidget {
 final Lessons kidsLessons;
 final int indexLessons;

  const kidsCard({super.key, required this.kidsLessons, required this.indexLessons, });

  @override
  Widget build(BuildContext context) {
    KidsController kidsController = Get.find();
    return InkWell(
     onTap: () {Get.to(BodyContentKidsScreen(indexLessons));
      },
      child: Container(
        height: Get.height * 0.1,
        decoration: const BoxDecoration(
          color: AppColors.kGreenColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             10.hSize,
              const VerticalDivider(
                color: AppColors.kWhiteColor,
                indent: 5,
                width: 15,
                endIndent: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          '${kidsLessons.title}',
                          style: const TextStyle(
                            color: AppColors.kGoldenColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.kWhiteColor,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
