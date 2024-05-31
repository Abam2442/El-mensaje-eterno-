// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/utils/components/appbar/direction_aware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.isSearch,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.iconColor = AppColors.kWhiteColor,
    this.title = '',
    this.isPinned = false,
  });
  final bool? isSearch;
  final Color backgroundColor;
  final Color iconColor;
  final bool isPinned;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leading: !Navigator.canPop(context)
          ? null
          : DirectionAware(
              child: IconButton(
                onPressed: () => Get.back(),
                icon: SvgPicture.asset(
                  AppAssets.kBackIcon,
                  color: iconColor,
                ),
              ),
            ),
      centerTitle: true,
      title: Text(
        title,
        style: Styles.textStyle18Godlen,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
      floating: true,
      snap: true,
      elevation: 0,
      pinned: isPinned,
    );
  }

  _navigatorBack() {
    Get.back();
  }
}
