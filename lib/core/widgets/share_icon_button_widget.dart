import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
// import 'package:share_plus/share_plus.dart';

class ShareIconButton extends StatelessWidget {
  const ShareIconButton(
      {super.key, required this.data, this.iconColor, this.iconSize});
  final String data;
  final Color? iconColor;
  final Size? iconSize;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Share.share(data);
      },
      icon: SvgPicture.asset(
        height: iconSize?.height,
        width: iconSize?.width,
        AppAssets.kShareIcon,
        colorFilter: ColorFilter.mode(
            iconColor ?? AppColors.kGoldenColor, BlendMode.srcIn),
      ),
    );
  }
}
