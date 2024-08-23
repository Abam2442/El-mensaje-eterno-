import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';

class HadithSectionName extends StatelessWidget {
  const HadithSectionName({
    super.key,
    required this.hadithBookName,
  });
  final String hadithBookName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.kGreenColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            hadithBookName,
            style: Styles.textStyle18Golden,
          ),
        ),
      ),
    );
  }
}
