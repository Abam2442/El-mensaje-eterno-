import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/styles/text_styles.dart';

class PrayTimeWidgetItem extends StatelessWidget {
  const PrayTimeWidgetItem({
    super.key,
    required this.prayName,
    required this.prayIcon,
    required this.prayTime,
    required this.isEnabled,
  });

  final String prayName;
  final String prayIcon;
  final String prayTime;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isEnabled
            ? SizedBox(
                height: 20,
                child: SvgPicture.asset(
                  AppAssets.arrowDropDownIcon,
                  fit: BoxFit.fitWidth,
                ))
            : const SizedBox(
                height: 20,
              ),
        const SizedBox(
          height: 2,
        ),
        Text(
          prayName,
          style: Styles.textStyle14Golden,
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          width: 25,
          height: 25,
          child: SvgPicture.asset(prayIcon, fit: BoxFit.fill),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          prayTime,
          style: Styles.textStyle12,
        ),
      ],
    );
  }
}
