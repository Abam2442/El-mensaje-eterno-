import '../constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PrimaryShimmer extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder border;
  final Color color;

  const PrimaryShimmer.rectangle({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.color = AppColors.kPrimaryColor,
    this.border = const RoundedRectangleBorder(),
  });

  const PrimaryShimmer.circular({
    super.key,
    required this.width,
    required this.height,
    this.color = AppColors.kPrimaryColor,
    this.border = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color.withOpacity(0.2),
      highlightColor: color.withOpacity(0.5),
      direction: ShimmerDirection.rtl,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: color.withOpacity(0.5),
          shape: border,
        ),
      ),
    );
  }
}
