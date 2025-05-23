import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/features/salah/view/Qibla/qibla_compass.dart';

class QiblaPage extends StatelessWidget {
  const QiblaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(child: QiblaCompass()));
  }
}
