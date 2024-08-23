import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCopyShareWidget extends StatelessWidget {
  const CustomCopyShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.transparent,
            child: SvgPicture.asset(
              AppAssets.kShareIcon,
              color: AppColors.white,
              width: 20.w,
            ),
          ),
          SizedBox(width: 5.w),
          CircleAvatar(
            backgroundColor: AppColors.transparent,
            child: SvgPicture.asset(
              AppAssets.kCopyIcon,
              color: AppColors.white,
              width: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
