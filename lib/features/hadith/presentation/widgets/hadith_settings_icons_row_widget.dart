
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HadithSettingsIconsRowWidget extends StatelessWidget {
  const HadithSettingsIconsRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        SvgPicture.asset(
          AppAssets.kShareIcon,
          color: AppColors.kWhiteColor,
        ),
        const SizedBox(
          width: 30,
        ),
        SvgPicture.asset(
          AppAssets.kCopyIcon,
          color: AppColors.kWhiteColor,
        ),
        const Spacer(),
        SvgPicture.asset(AppAssets.kBookmarkIcon),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
