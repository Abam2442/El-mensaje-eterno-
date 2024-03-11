import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AyaText extends StatelessWidget {
  const AyaText({
    super.key,
    required this.aya,
    required this.ayaNumber,
    this.textDirection = TextDirection.rtl,
    this.ayaStyle = Styles.textStyle18Godlen,
    this.ayaNumberStyle = Styles.textStyleQuranPageNumber,
  });

  final String aya;
  final int ayaNumber;
  final TextDirection textDirection;
  final TextStyle ayaStyle;
  final TextStyle ayaNumberStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textDirection: textDirection,
      text: TextSpan(
        style: ayaStyle,
        children: [
          TextSpan(text: aya),
          TextSpan(text: ' ($ayaNumber)', style: ayaNumberStyle),
        ],
      ),
    );
  }
}
