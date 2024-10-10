import '../constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrimaryLoader extends StatelessWidget {
  final double size;
  final Color color;

  const PrimaryLoader({
    super.key,
    this.size = 50,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeArchedCircle(
      size: size,
      color: color,
    );
  }
}
