import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_text_styles.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
class Options extends StatelessWidget {
  Options({
    super.key,
    required this.label,
    required this.image,
    this.onTap,
  });

  final String label;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 150,
        // width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.kPrimaryColor,
        ),
        padding: 16.vhEdge,
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.asset(image),
            ),
            FittedBox(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextColors.textStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}