import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';

class HadithNumberWidget extends StatelessWidget {
  const HadithNumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAssets.kZaghrafaIcon,
          ),
          const Text('1', style: Styles.textStyle18Golden),
        ],
      ),
    );
  }
}
