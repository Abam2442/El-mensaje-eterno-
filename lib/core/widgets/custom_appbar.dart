import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({required this.title, required this.tabs, super.key});

  final String title;
  final List<Tab> tabs;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColors.kGoldenColor, //change your color here
      ),
      backgroundColor: AppColors.kPrimaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            title,
            style: Styles.textStyle18Godlen
                .copyWith(overflow: TextOverflow.ellipsis),
          )),
          SvgPicture.asset(AppAssets.logoApp)
        ],
      ),
      bottom: TabBar(
        dividerColor: AppColors.kGoldenColor,
        labelColor: AppColors.kGoldenColor,
        indicatorColor: AppColors.kGreenColor,
        isScrollable: true,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class SalahAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SalahAppbar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Styles.textStyle20Golden,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.kGoldenColor,
      ),
      backgroundColor: AppColors.kPrimaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
