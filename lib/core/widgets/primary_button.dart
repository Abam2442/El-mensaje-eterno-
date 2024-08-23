import '../constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double width;
  final void Function()? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.primary,
        disabledColor: AppColors.primary.withOpacity(0.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r), side: BorderSide.none),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
