import 'package:flutter/material.dart';

import 'package:hiwayda_oracion_islamica/core/constants/app_assets.dart';
class BasmalaImage extends StatelessWidget {
  const BasmalaImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.kBasmalaImage,
      height: 78,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
