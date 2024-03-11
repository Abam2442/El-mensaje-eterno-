import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/helper/extensions/assetss_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/views/widgets/main_text.dart';

class MoreRow extends StatelessWidget {
  const MoreRow({
    super.key,
    required this.title,
    required this.moreString,
    this.onClickMore,
    this.padding,
  });
  final String title;
  final String moreString;
  final VoidCallback? onClickMore;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? 0.hEdge,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MainText(
            title,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          InkWell(
            onTap: onClickMore ?? () {},
            borderRadius: 6.cBorder,
            child: Padding(
              padding: 10.vhEdge,
              child: MainText(
                moreString,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
