import 'package:flutter/widgets.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/widgets/aya_words_widget.dart';

import 'package:http/http.dart' as http;

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
        ],
      ),
    );
  }
}


class AyaArabicText extends StatelessWidget {
  const AyaArabicText({
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
    return Align(
      alignment: Alignment.centerRight,
      child: Directionality(
        textDirection: textDirection,
        child: AyaWordsWidget(aya: aya, ayaNumber : ayaNumber),
      ),
    );

  

  }
}


