import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import 'direction_aware.dart';

class SliverAppBarTabWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final bool isPinned;
  final String title;
  final List<Tab> tabs;
  final TabController tabController;

  const SliverAppBarTabWidget({
    super.key,
    this.backgroundColor = AppColors.transparent,
    this.iconColor = AppColors.transparent,
    this.isPinned = false,
    this.title = '',
    required this.tabs,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      leading: !Navigator.canPop(context)
          ? null
          : DirectionAware(
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 25,
                  ),
                  child: SvgPicture.asset(
                    AppAssets.kBackIcon,
                    color: iconColor,
                  ),
                ),
              ),
            ),
      floating: true,
      snap: true,
      elevation: 0,
      pinned: isPinned,
      bottom: TabBar(
        tabs: tabs,
        controller: tabController,
        labelColor: AppColors.kGoldenColor,
        unselectedLabelColor: const Color(0xFFffE4AC),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: AppColors.kGreenColor,
      ),
    );
  }
}
